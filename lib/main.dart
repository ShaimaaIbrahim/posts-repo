import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:posts_repo/domain/use_case/load_posts.dart';
import 'package:posts_repo/features/home/view_models/post_bloc.dart';
import 'package:posts_repo/features/home/view_models/post_event.dart';
import 'package:posts_repo/features/main/main_screen.dart';
import 'core/di/dependency_injector.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'domain/repository/post_repository.dart';
import 'features/settings/view_models/language/language_bloc.dart';
import 'gen/app_localizations.dart';


void main() async{
  //di for all modules.
  DependencyInjector().injectModules();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageBloc(),
      child: _AppContent(),
    );
  }
}

class _AppContent extends StatelessWidget {
  final LanguageBloc _languageBloc = LanguageBloc();

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: _languageBloc,
      child: BlocBuilder<LanguageBloc, LanguageState>(
        bloc: _languageBloc,
        builder: (context, state) {
          debugPrint("stateLang: ${state.locale}");
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'My App',
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: ThemeMode.system,
            home: MainScreen(),
          );
        },
      )
    );
  }
}

// class MyApp extends StatefulWidget {
//   const MyApp({super.key});
//
//   @override
//   State<MyApp> createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       // Provide the LanguageBloc to the entire app
//         create: (context) => LanguageBloc(),
//         child: BlocBuilder<LanguageBloc, LanguageState>(
//           builder: (ctx, state){
//             debugPrint("stateLang: ${state.locale}");
//             return MaterialApp.router(
//               debugShowCheckedModeBanner: false,
//               title: 'My App',
//               locale: state.locale,
//               localizationsDelegates: AppLocalizations.localizationsDelegates,
//               supportedLocales: AppLocalizations.supportedLocales,
//               theme: AppTheme.light(),
//               darkTheme: AppTheme.dark(),
//               themeMode: ThemeMode.system,
//               routerConfig: appRouter,
//             );
//           },
//         )
//     );
//   }
// }


