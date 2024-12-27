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

  /// `We are the best health tracker app in Vietnam`
  String get intro {
    return Intl.message(
      'We are the best health tracker app in Vietnam',
      name: 'intro',
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

  /// `Email`
  String get email {
    return Intl.message(
      'Email',
      name: 'email',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get emailHint {
    return Intl.message(
      'Email',
      name: 'emailHint',
      desc: '',
      args: [],
    );
  }

  /// `Email must not be empty`
  String get emailEmpty {
    return Intl.message(
      'Email must not be empty',
      name: 'emailEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Email is not valid`
  String get emailFormatError {
    return Intl.message(
      'Email is not valid',
      name: 'emailFormatError',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get password {
    return Intl.message(
      'Password',
      name: 'password',
      desc: '',
      args: [],
    );
  }

  /// `Password`
  String get passwordHint {
    return Intl.message(
      'Password',
      name: 'passwordHint',
      desc: '',
      args: [],
    );
  }

  /// `Password must not be empty`
  String get passwordEmpty {
    return Intl.message(
      'Password must not be empty',
      name: 'passwordEmpty',
      desc: '',
      args: [],
    );
  }

  /// `Register`
  String get register {
    return Intl.message(
      'Register',
      name: 'register',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get registerText1 {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'registerText1',
      desc: '',
      args: [],
    );
  }

  /// `Create one`
  String get registerText2 {
    return Intl.message(
      'Create one',
      name: 'registerText2',
      desc: '',
      args: [],
    );
  }

  /// `Create Account`
  String get registerTitle1 {
    return Intl.message(
      'Create Account',
      name: 'registerTitle1',
      desc: '',
      args: [],
    );
  }

  /// `Explore new recipes with us today !!!`
  String get registerTitle2 {
    return Intl.message(
      'Explore new recipes with us today !!!',
      name: 'registerTitle2',
      desc: '',
      args: [],
    );
  }

  /// `Forgot Password?`
  String get forgotPassword {
    return Intl.message(
      'Forgot Password?',
      name: 'forgotPassword',
      desc: '',
      args: [],
    );
  }

  /// `Please check your email to reset your password`
  String get forgotPasswordSuccess {
    return Intl.message(
      'Please check your email to reset your password',
      name: 'forgotPasswordSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Registration successful. Please check your email to confirm your account`
  String get registerSuccess {
    return Intl.message(
      'Registration successful. Please check your email to confirm your account',
      name: 'registerSuccess',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get loginText1 {
    return Intl.message(
      'Already have an account? ',
      name: 'loginText1',
      desc: '',
      args: [],
    );
  }

  /// `Log in`
  String get loginText2 {
    return Intl.message(
      'Log in',
      name: 'loginText2',
      desc: '',
      args: [],
    );
  }

  /// `Name`
  String get name {
    return Intl.message(
      'Name',
      name: 'name',
      desc: '',
      args: [],
    );
  }

  /// `Enter your Name`
  String get nameHint {
    return Intl.message(
      'Enter your Name',
      name: 'nameHint',
      desc: '',
      args: [],
    );
  }

  /// `Please fill in your name`
  String get nameError {
    return Intl.message(
      'Please fill in your name',
      name: 'nameError',
      desc: '',
      args: [],
    );
  }

  /// `OK`
  String get ok {
    return Intl.message(
      'OK',
      name: 'ok',
      desc: '',
      args: [],
    );
  }

  /// `No information field`
  String get noInfoField {
    return Intl.message(
      'No information field',
      name: 'noInfoField',
      desc: '',
      args: [],
    );
  }

  /// `All`
  String get allFilter {
    return Intl.message(
      'All',
      name: 'allFilter',
      desc: '',
      args: [],
    );
  }

  /// `Muscle Group`
  String get muscleGroupFilter {
    return Intl.message(
      'Muscle Group',
      name: 'muscleGroupFilter',
      desc: '',
      args: [],
    );
  }

  /// `Difficulty`
  String get difficultyFilter {
    return Intl.message(
      'Difficulty',
      name: 'difficultyFilter',
      desc: '',
      args: [],
    );
  }

  /// `Chest`
  String get chest {
    return Intl.message(
      'Chest',
      name: 'chest',
      desc: '',
      args: [],
    );
  }

  /// `Upper Back`
  String get upperBack {
    return Intl.message(
      'Upper Back',
      name: 'upperBack',
      desc: '',
      args: [],
    );
  }

  /// `Lower Back`
  String get lowerBack {
    return Intl.message(
      'Lower Back',
      name: 'lowerBack',
      desc: '',
      args: [],
    );
  }

  /// `Shoulders`
  String get shoulders {
    return Intl.message(
      'Shoulders',
      name: 'shoulders',
      desc: '',
      args: [],
    );
  }

  /// `Biceps`
  String get biceps {
    return Intl.message(
      'Biceps',
      name: 'biceps',
      desc: '',
      args: [],
    );
  }

  /// `Triceps`
  String get triceps {
    return Intl.message(
      'Triceps',
      name: 'triceps',
      desc: '',
      args: [],
    );
  }

  /// `Forearms`
  String get forarms {
    return Intl.message(
      'Forearms',
      name: 'forarms',
      desc: '',
      args: [],
    );
  }

  /// `Core`
  String get core {
    return Intl.message(
      'Core',
      name: 'core',
      desc: '',
      args: [],
    );
  }

  /// `Calves`
  String get calves {
    return Intl.message(
      'Calves',
      name: 'calves',
      desc: '',
      args: [],
    );
  }

  /// `Thighs`
  String get thighs {
    return Intl.message(
      'Thighs',
      name: 'thighs',
      desc: '',
      args: [],
    );
  }

  /// `Glutes`
  String get glutes {
    return Intl.message(
      'Glutes',
      name: 'glutes',
      desc: '',
      args: [],
    );
  }

  /// `Full Body`
  String get fullBody {
    return Intl.message(
      'Full Body',
      name: 'fullBody',
      desc: '',
      args: [],
    );
  }

  /// `Beginner`
  String get beginner {
    return Intl.message(
      'Beginner',
      name: 'beginner',
      desc: '',
      args: [],
    );
  }

  /// `Intermediate`
  String get intermediate {
    return Intl.message(
      'Intermediate',
      name: 'intermediate',
      desc: '',
      args: [],
    );
  }

  /// `Advance`
  String get advance {
    return Intl.message(
      'Advance',
      name: 'advance',
      desc: '',
      args: [],
    );
  }

  /// `There is no data`
  String get noData {
    return Intl.message(
      'There is no data',
      name: 'noData',
      desc: '',
      args: [],
    );
  }

  /// `Exercise Detail`
  String get exerciseDetail {
    return Intl.message(
      'Exercise Detail',
      name: 'exerciseDetail',
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
