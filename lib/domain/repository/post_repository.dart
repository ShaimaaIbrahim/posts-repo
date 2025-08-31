import 'package:posts_repo/domain/entities/post_entity.dart';

abstract class PostRepository {
  Future<List<PostEntity>> fetchPosts();
  Future<List<PostEntity>> searchPosts(String searchText);
}

