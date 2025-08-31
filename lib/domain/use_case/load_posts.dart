import 'package:posts_repo/domain/repository/post_repository.dart';

import '../entities/post_entity.dart';

class LoadPosts {
  final PostRepository repository;

  LoadPosts(this.repository);

  Future<List<PostEntity>> call({
    int page = 1,
    int limit = 10,
    String? filter,
    DateTime? startDate,
    DateTime? endDate,
  }) async {
    try {
     return await repository.fetchPosts();
    } catch (e) {
       rethrow;
      //throw Failure('Failed to load expenses: ${e.toString()}');
    }
  }
}