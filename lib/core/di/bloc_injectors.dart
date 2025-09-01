import 'package:posts_repo/domain/repository/post_repository.dart';
import 'package:posts_repo/domain/use_case/load_posts.dart';
import 'package:posts_repo/features/home/view_models/post_bloc.dart';
import 'package:posts_repo/features/settings/view_models/language/language_bloc.dart';

import 'base_injector.dart';
import 'dependency_injector.dart';

class BlocInjectors extends BaseInjector {
  static final blocInjectors = [
        () => diInstance.registerLazySingleton<LanguageBloc>(
          () => LanguageBloc(),
    ),
        () => diInstance.registerLazySingleton<PostBloc>(
          () => PostBloc(
              loadPosts: LoadPosts(diInstance<PostRepository>()),
      ),
    )
  ];

  @override
  void injectModules() {
    for (final blocInjector in blocInjectors) {
      blocInjector.call();
    }
  }
}
