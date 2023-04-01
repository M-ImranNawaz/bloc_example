import 'package:bloc_example/data/repositories/post_repository.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/post.dart';

part 'post_state.dart';

class PostCubit extends Cubit<PostState> {
  PostCubit() : super(PostLoading()) {
    fetchPosts();
  }

  final PostRepository _postRepository = PostRepository();

  void fetchPosts() async {
    try {
      List<Post> posts = await _postRepository.fetchPosts();
      emit(PostLoaded(posts));
    } on DioError catch (e) {
      emit(PostError(e.toString()));
    }
  }
}
