import 'package:get_it/get_it.dart';
import 'package:posts_repo/core/di/bloc_injectors.dart';
import 'package:posts_repo/data/data_source/remote/posts_remote_data_source.dart';
import 'package:posts_repo/domain/use_case/load_posts.dart';

import '../../data/repositories/post_repository.dart';
import '../../domain/repository/post_repository.dart';
import '../network/network_manager.dart';
import 'base_injector.dart';

final networkManager = NetworkManager.instance;

final diInstance = GetIt.instance;

class DependencyInjector {
  
  /// injectModules that used in app-runner
  Future<void> injectModules() async {
    
    //inject all data source in app.
    diInstance.registerLazySingleton<PostsRemoteDataSource>(
            () => PostsRemoteDataSourceImp(networkManager));

    //inject all repos in app.
    diInstance.registerLazySingleton<PostRepository>(
            () => PostRepositoryImp(
            remoteDataSource: diInstance<PostsRemoteDataSource>())
        );
    //inject all use cases in app.
    diInstance.registerLazySingleton<LoadPosts>(
            () => LoadPosts(diInstance<PostRepository>()));
    
    //inject all Blocs in app.
    BlocInjectors().injectModules();
  }
}