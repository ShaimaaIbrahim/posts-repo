import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'language_event.dart';
part 'language_state.dart';

class LanguageBloc extends Bloc<LanguageEvent, LanguageState> {
  LanguageBloc() : super(const LanguageState(Locale('en'))) {
    // Handler for ChangeLanguageEvent
    on<ChangeLanguageEvent>((event, emit) {
      emit(LanguageState(Locale(event.languageCode)));
    });
  }

  // Helper method to get the current language code
  String get currentLanguage => state.languageCode;
}