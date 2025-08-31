part of 'language_bloc.dart';

// Abstract base class for events
sealed class LanguageEvent {}

// Concrete event to change the language
class ChangeLanguageEvent extends LanguageEvent {
  final String languageCode;

  ChangeLanguageEvent(this.languageCode);
}
