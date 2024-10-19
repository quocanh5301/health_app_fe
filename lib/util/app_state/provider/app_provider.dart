import 'dart:ui';

import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/date_time.dart';

class AppProvider {
  String changeLocale(String languageCode) {
    S.delegate.load(Locale(languageCode, ""));
    SharedPref.setLanguage(languageCode);
    DateTimeHelper.setMessage(languageCode);
    return languageCode;
  }

  String loadCurrentLanguage() {
    String currLanguageCode = SharedPref.getLanguage();
    S.delegate.load(Locale(currLanguageCode, ""));
    DateTimeHelper.setMessage(currLanguageCode);
    return currLanguageCode;
  }
}
