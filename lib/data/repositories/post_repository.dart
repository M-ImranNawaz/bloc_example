import 'dart:io';

import 'package:bloc_example/data/models/post.dart';
import 'package:bloc_example/data/repositories/api/api.dart';
import 'package:dio/dio.dart';

class PostRepository {
  API api = API();
  Future<List<Post>> fetchPosts() async {
    try {
      Response response = await api.sendRequest.get("/posts");
      final List<dynamic> postMaps = response.data;
      return postMaps.map((postMap) => Post.fromJson(postMap)).toList();
    } on SocketException {
      print('no Internet');
    }  catch (e) {
      print(e);
    }
    return [];
  }
}
