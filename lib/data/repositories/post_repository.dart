import 'package:posts_repo/data/data_source/remote/posts_remote_data_source.dart';
import 'package:posts_repo/domain/entities/post_entity.dart';
import 'package:posts_repo/domain/repository/post_repository.dart';

import '../../data/models/post_model.dart';

class PostRepositoryImp implements PostRepository {
  final PostsRemoteDataSource remoteDataSource;
  PostRepositoryImp({required this.remoteDataSource});

  @override
  Future<List<PostEntity>> fetchPosts() async{
    List<PostModel> posts =  await remoteDataSource.fetchPosts();
    return posts.map((post)=> post.toEntity()).toList();
  }

  @override
  Future<List<PostEntity>> searchPosts(String searchText) async{
    List<PostModel> posts =  await remoteDataSource.fetchPosts();
    return posts.map((post)=> post.toEntity()).where((post)=> post.title.contains(searchText) || post.body.contains(searchText)).toList();
  }

}
