import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:health_app_flutter/data/share_pref/shared_pref.dart';

abstract class ILocalNotificationHelper {
  Future<void> scheduleNotification(String title, String body);
  Future<void> cancelNotification();
}

class LocalNotificationHelper implements ILocalNotificationHelper {
  static const String _channelId = "Fitness_app";
  static const String _channelName = "Fitness_app";
  static const int _notificationId = 530411;

  final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  Future<void> init() async {
    const AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    final DarwinInitializationSettings initializationSettingsDarwin =
        DarwinInitializationSettings(
      onDidReceiveLocalNotification: (id, title, body, payload) async {},
    );

    final InitializationSettings initializationSettings =
        InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsDarwin,
    );

    await flutterLocalNotificationsPlugin.initialize(
      initializationSettings,
      onDidReceiveNotificationResponse: (notificationResponse) async {},
    );
  }

  @override
  Future<void> scheduleNotification(String title, String body) async {
    const AndroidNotificationDetails androidNotificationDetails =
        AndroidNotificationDetails(
      _channelId,
      _channelName,
      styleInformation: BigTextStyleInformation(''),
    );

    const DarwinNotificationDetails darwinNotificationDetails =
        DarwinNotificationDetails();

    const NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidNotificationDetails,
      iOS: darwinNotificationDetails,
    );

    await flutterLocalNotificationsPlugin.show(
      _notificationId,
      title,
      body,
      platformChannelSpecifics,
    );
  }

  @override
  Future<void> cancelNotification() async {
    await flutterLocalNotificationsPlugin.cancel(_notificationId);
  }

    Future<void> handleNotificationSetting(String title, String body) async {
    final notificationOn = await SharedPref.getNotificationSetting();
    if (notificationOn) {
      await scheduleNotification(title, body);
    } else {
      await cancelNotification();
    }
  }
}