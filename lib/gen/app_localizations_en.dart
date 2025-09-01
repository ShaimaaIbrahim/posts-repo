// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String welcomeMessage(Object name) {
    return 'Welcome, $name!';
  }

  @override
  String get home => 'Home';

  @override
  String get settings => 'Settings';

  @override
  String get language => 'Language';

  @override
  String itemsInSearch(Object itemCount, Object searchText) {
    return 'Found $itemCount results for \"$searchText\"';
  }

  @override
  String get changeLanguage => 'Choose your prefered language:';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';
}
