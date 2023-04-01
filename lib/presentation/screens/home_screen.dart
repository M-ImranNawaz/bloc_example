import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/post.dart';
import '../../logic/cubits/post_cubit/post_cubit.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API Handling'),
        centerTitle: true,
      ),
      body: SafeArea(child: BlocBuilder<PostCubit, PostState>(
        builder: (context, state) {
          if (state is PostLoading) {
            return const Center(child: CircularProgressIndicator.adaptive());
          } else if (state is PostLoaded) {
            return ListView.builder(
              itemBuilder: (context, index) {
                Post post = state.posts[index];
                return ListTile(
                  title: Text(post.title),
                  subtitle: Text(post.body),
                );
              },
              itemCount: state.posts.length,
            );
          }
          return const Center(
            child: Text('Something went wrong!'),
          );
        },
      )),
    );
  }
}
