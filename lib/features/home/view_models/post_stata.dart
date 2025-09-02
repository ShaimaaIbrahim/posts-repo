
import 'package:flutter/cupertino.dart';
import 'package:posts_repo/domain/entities/post_entity.dart';

abstract class PostState {}

class PostsInitial extends PostState {
}

class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<PostEntity> posts;
  final int? postsCount;
  final TextEditingController? controller;

  PostsLoaded({
    required this.posts,
    this.postsCount,
    this.controller
  });

  PostsLoaded copyWith({
    List<PostEntity>? posts,
    int? postsCount,
    TextEditingController? controller
  }) {
    return PostsLoaded(
      posts: posts ?? this.posts,
      postsCount: postsCount ?? this.postsCount,
      controller: controller ?? this.controller
    );
  }
}

class PostsError extends PostState {
  final String message;

  PostsError(this.message);
}
