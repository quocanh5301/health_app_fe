// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Create a Healthier Lifestyle`
  String get titleIntro {
    return Intl.message(
      'Create a Healthier Lifestyle',
      name: 'titleIntro',
      desc: '',
      args: [],
    );
  }

  /// `Boost Your Stamina`
  String get introTitle1 {
    return Intl.message(
      'Boost Your Stamina',
      name: 'introTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Stay active and improve your endurance by incorporating daily runs into your routine. Track your progress and keep moving forward!`
  String get introDescription1 {
    return Intl.message(
      'Stay active and improve your endurance by incorporating daily runs into your routine. Track your progress and keep moving forward!',
      name: 'introDescription1',
      desc: '',
      args: [],
    );
  }

  /// `Strengthen Your Core`
  String get introTitle2 {
    return Intl.message(
      'Strengthen Your Core',
      name: 'introTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Achieve your fitness goals with at-home workouts that focus on building core strength and muscle endurance. No equipment? No problem!`
  String get introDescription2 {
    return Intl.message(
      'Achieve your fitness goals with at-home workouts that focus on building core strength and muscle endurance. No equipment? No problem!',
      name: 'introDescription2',
      desc: '',
      args: [],
    );
  }

  /// `Prioritize Your Recovery`
  String get introTitle3 {
    return Intl.message(
      'Prioritize Your Recovery',
      name: 'introTitle3',
      desc: '',
      args: [],
    );
  }

  /// `Good sleep is essential for muscle recovery and overall well-being. Optimize your sleep schedule and wake up refreshed to tackle a new day!`
  String get introDescription3 {
    return Intl.message(
      'Good sleep is essential for muscle recovery and overall well-being. Optimize your sleep schedule and wake up refreshed to tackle a new day!',
      name: 'introDescription3',
      desc: '',
      args: [],
    );
  }

  /// `Confirm`
  String get confirm {
    return Intl.message(
      'Confirm',
      name: 'confirm',
      desc: '',
      args: [],
    );
  }

  /// `Cancel`
  String get cancel {
    return Intl.message(
      'Cancel',
      name: 'cancel',
      desc: '',
      args: [],
    );
  }

  /// `Next`
  String get next {
    return Intl.message(
      'Next',
      name: 'next',
      desc: '',
      args: [],
    );
  }

  /// `Previous`
  String get previous {
    return Intl.message(
      'Previous',
      name: 'previous',
      desc: '',
      args: [],
    );
  }

  /// `Login`
  String get login {
    return Intl.message(
      'Login',
      name: 'login',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
