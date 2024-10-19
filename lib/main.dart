import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_intro/flutter_intro.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';
import 'package:health_app_flutter/firebase_options.dart';
import 'package:health_app_flutter/generated/l10n.dart';
import 'package:health_app_flutter/util/app_state/bloc/app_cubit.dart';
import 'package:health_app_flutter/util/app_state/bloc/app_state.dart';
import 'package:health_app_flutter/util/injection.dart';
import 'package:health_app_flutter/util/notification.dart';
import 'package:health_app_flutter/util/router.dart';
import 'package:health_app_flutter/util/styles.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:health_app_flutter/util/injection.dart' as di;

@pragma('vm:entry-point')
Future<void> firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  try {
    debugPrint('Handling a background message ${message.data}');
    if (message.data.isNotEmpty) {
      final String? title = message.data['title'];
      final String? content = message.data['content'];

      if (title != null && content != null) {
        // Access shared preferences directly without getIt
        final prefs = await SharedPreferences.getInstance();
        await prefs.setBool(SharedPref.newNotificationKey, true);
        debugPrint('set new notification alert to true');

        // Manually initialize LocalNotificationHelper and trigger notification
        final notificationHelper = LocalNotificationHelper();
        await notificationHelper.init(); // Initialize notifications if needed
        notificationHelper.handleNotificationSetting(title, content);
      }
    }
  } catch (e) {
    debugPrint('Handling a background message error $e');
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPref.prefs = await SharedPreferences.getInstance();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await di.init();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
        systemNavigationBarColor: Colors.white,
        systemNavigationBarIconBrightness: Brightness.dark),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Intro(
      child: BlocProvider(
        create: (context) => sl<AppCubit>()..loadCurrentLanguage(),
        child: BlocBuilder<AppCubit, AppState>(
          builder: (context, state) {
            return ScreenUtilInit(
              designSize: const Size(390, 844),
              minTextAdapt: true,
              splitScreenMode: true,
              builder: (context, child) {
                return MaterialApp.router(
                    debugShowCheckedModeBanner: false,
                    title: 'Fitness',
                    localizationsDelegates: const [
                      S.delegate,
                      GlobalMaterialLocalizations.delegate,
                      GlobalWidgetsLocalizations.delegate,
                      GlobalCupertinoLocalizations.delegate
                    ],
                    locale: const Locale("state.languageCode"),
                    supportedLocales: S.delegate.supportedLocales,
                    theme: ThemeData(
                      colorScheme:
                          ColorScheme.fromSeed(seedColor: '#08357C'.toColor()),
                      textTheme: GoogleFonts.arimoTextTheme(
                        Theme.of(context).textTheme,
                      ),
                      useMaterial3: true,
                    ),
                    routeInformationParser: router.routeInformationParser,
                    routerDelegate: router.routerDelegate,
                    routeInformationProvider: router.routeInformationProvider);
              },
            );
          },
        ),
      ),
    );
  }
}
