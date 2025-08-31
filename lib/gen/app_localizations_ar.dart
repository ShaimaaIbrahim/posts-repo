// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Arabic (`ar`).
class AppLocalizationsAr extends AppLocalizations {
  AppLocalizationsAr([String locale = 'ar']) : super(locale);

  @override
  String get helloWorld => 'مرحباً بالعالم!';

  @override
  String welcomeMessage(Object name) {
    return 'أهلاً وسهلاً، $name!';
  }

  @override
  String get settings => 'الإعدادات';

  @override
  String get changeLanguage => 'تغيير اللغة';

  @override
  String get english => 'الإنجليزية';

  @override
  String get arabic => 'العربية';
}
