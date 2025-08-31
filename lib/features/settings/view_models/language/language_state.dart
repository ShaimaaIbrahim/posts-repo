part of 'language_bloc.dart';

class LanguageState {
  final Locale locale;

  const LanguageState(this.locale);

  String get languageCode => locale.languageCode;

  // Override equality for bloc to efficiently check state changes
  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is LanguageState && other.languageCode == languageCode;
  }

  @override
  int get hashCode => languageCode.hashCode;
}