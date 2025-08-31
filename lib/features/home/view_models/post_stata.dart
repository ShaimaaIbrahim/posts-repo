
import 'package:posts_repo/domain/entities/post_entity.dart';

abstract class PostState {}

class PostsInitial extends PostState {
}

class PostsLoading extends PostState {}

class PostsLoaded extends PostState {
  final List<PostEntity> posts;
  final int? postsCount;

  PostsLoaded({
    required this.posts,
    this.postsCount
  });

  PostsLoaded copyWith({
    List<PostEntity>? posts,
    int? postsCount
  }) {
    return PostsLoaded(
      posts: posts ?? this.posts,
      postsCount: postsCount ?? this.postsCount,
    );
  }
}

class PostsError extends PostState {
  final String message;

  PostsError(this.message);
}
