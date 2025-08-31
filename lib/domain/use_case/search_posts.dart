import 'package:posts_repo/domain/repository/post_repository.dart';

import '../entities/post_entity.dart';

class SearchPosts {
  final PostRepository repository;

  SearchPosts(this.repository);

  Future<List<PostEntity>> call({
    String? searchText
  }) async {
    try {
      return await repository.searchPosts(searchText??"");
    } catch (e) {
       rethrow;
      //throw Failure('Failed to load expenses: ${e.toString()}');
    }
  }
}