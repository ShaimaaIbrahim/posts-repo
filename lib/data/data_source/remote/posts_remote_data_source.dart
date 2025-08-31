import 'package:flutter/cupertino.dart' show debugPrint;
import 'package:posts_repo/data/models/post_model.dart';
import '../../../core/network/api_endpoints.dart';
import '../../../core/network/network_manager.dart';

abstract class PostsRemoteDataSource {
  Future<List<PostModel>> fetchPosts();
}

class PostsRemoteDataSourceImp implements PostsRemoteDataSource{
  final NetworkManager networkManager;

  PostsRemoteDataSourceImp(this.networkManager);


  @override
  Future<List<PostModel>> fetchPosts() async{
    final response = await networkManager.get(ApiEndpoints.postsEndpoint);
    debugPrint("response: $response");
    return (response as List).map((postJson) => PostModel.fromJson(postJson)).toList();
  }
  
}
