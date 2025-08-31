import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'core/router/app_router.dart';
import 'core/theme/app_theme.dart';
import 'features/settings/view_models/language/language_bloc.dart';
import 'gen/app_localizations.dart';


void main() async{
  runApp( MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});
  
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // Provide the LanguageBloc to the entire app
      create: (context) => LanguageBloc(),
      child: BlocBuilder<LanguageBloc, LanguageState>(
        builder: (ctx, state){
          return MaterialApp.router(
            debugShowCheckedModeBanner: false,
            title: 'My App',
            locale: state.locale,
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            supportedLocales: AppLocalizations.supportedLocales,
            theme: AppTheme.light(),
            darkTheme: AppTheme.dark(),
            themeMode: ThemeMode.system,
            routerConfig: appRouter,
          );
        },
      )
    );
  }
}