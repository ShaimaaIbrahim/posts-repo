// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'Hello World!';

  @override
  String welcomeMessage(Object name) {
    return 'Welcome, $name!';
  }

  @override
  String get home => 'الرئيسية';

  @override
  String get settings => 'الإعدادات';

  @override
  String get language => 'اللغة';

  @override
  String itemsInSearch(Object itemCount, Object searchText) {
    return 'Found $itemCount results for \"$searchText\"';
  }

  @override
  String get changeLanguage => 'اختر لغتك المفضلة:';

  @override
  String get english => 'English';

  @override
  String get arabic => 'العربية';
}
