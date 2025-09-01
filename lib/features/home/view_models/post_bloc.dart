import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart' show Bloc, Emitter;
import 'package:posts_repo/domain/entities/post_entity.dart';

import '../../../core/utils/failure.dart';
import '../../../domain/use_case/load_posts.dart';
import '../../../domain/use_case/search_posts.dart';
import 'post_event.dart';
import 'post_stata.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final LoadPosts loadPosts;
  // final SearchPosts searchPosts;

  List<PostEntity> posts = [];
  
  PostBloc({
    required this.loadPosts,
    // required this.searchPosts
  }) : super(PostsInitial()) {
    on<LoadPostsEvent>(_onLoadPosts);
    on<SearchPostsEvent>(_onSearchPosts);
  }

  
  Future<void> _onLoadPosts(
      LoadPostsEvent event,
      Emitter<PostState> emit,
      ) async {
    emit(PostsLoading());
    try {
      final posts = await loadPosts();
      this.posts = posts;
      
      emit(PostsLoaded(
        posts: posts,
        postsCount: posts.length
      ));
    } on Failure catch (e) {
      emit(PostsError(e.message));
    }
  }

  Future<void> _onSearchPosts(
      SearchPostsEvent event,
      Emitter<PostState> emit,
      ) async {
    emit(PostsLoading());
    try {
      var posts = this.posts.where((post)=>
        post.title.toLowerCase().contains(event.searchText) ||
        post.body.toLowerCase().contains(event.searchText)).toList();
      
      emit(PostsLoaded(
          posts: posts,
          postsCount: posts.length
      ));
      debugPrint("count: ${posts.length}");
    } on Failure catch (e) {
      emit(PostsError(e.message));
    }
  }
  
}