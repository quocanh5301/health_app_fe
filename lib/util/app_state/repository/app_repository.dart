import 'package:fpdart/fpdart.dart';
import 'package:health_app_flutter/util/app_state/provider/app_provider.dart';

class AppRepository {
  const AppRepository({required this.appProvider});

  final AppProvider appProvider;

  TaskEither<String, String> changeLocale(String languageCode) =>
      TaskEither.tryCatch(
        () async => appProvider.changeLocale(languageCode),
        (error, stackTrace) => error.toString(),
      );

  TaskEither<String, String> loadCurrentLanguage() => TaskEither.tryCatch(
        () async => appProvider.loadCurrentLanguage(),
        (error, stackTrace) => error.toString(),
      );
}
