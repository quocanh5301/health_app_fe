import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

class DateTimeHelper {
  static const String dateFormat1 = "yyyy-MM-dd HH:mm:ss";
  static const String dateFormat2 = "dd/MM/yyyy";
  // static const String dateFormat3 = "HH:mm dd/MM/yyyy";
  static const String dateFormat4 = "dd/MM/yyyy HH:mm:ss";
  static const String dateFormat5 = "HH:mm:ss";

  static String format4StringToHHmmss(
    String dateTimeString,
  ) {
    if (dateTimeString == '') {
      throw Exception("Empty date string");
    }
    DateTime chosenTime = DateFormat(dateFormat4).parse(dateTimeString);
    String hour;
    String minute;
    String second;
    if (chosenTime.hour < 10) {
      hour = "0${chosenTime.hour}";
    } else {
      hour = "${chosenTime.hour}";
    }
    if (chosenTime.minute < 10) {
      minute = "0${chosenTime.minute}";
    } else {
      minute = "${chosenTime.minute}";
    }
    if (chosenTime.second < 10) {
      second = "0${chosenTime.second}";
    } else {
      second = "${chosenTime.second}";
    }
    return "$hour:$minute:$second";
  }

  static String getDateTimeToday() {
    return DateFormat(dateFormat4).format(DateTime.now());
  }

  static String convertFormat5ToFormat4String(String timeString) {
    // Get the current date
    print("qa alarm pop date time 22222: $timeString");
    print("data: ${timeString.split(":")[0]}");
    DateTime now = DateTime.now();

    // Parse the input time (ignoring date, so we use the current date)
    DateTime parsedTime = DateTime(
        now.year,
        now.month,
        now.day,
        int.parse(timeString.split(":")[0]),
        int.parse(timeString.split(":")[1]),
        int.parse(timeString.split(":")[2]));

    // Format the result in "dd/MM/yyyy HH:mm:ss"
    String formattedDate = DateFormat(dateFormat4).format(parsedTime);

    return formattedDate;
  }

  static String getTimeStringFromInts(
    int hour,
    int minute,
    int second,
  ) {
    String myHour;
    String myMinute;
    String mySecond;
    if (hour < 10) {
      myHour = "0$hour";
    } else {
      myHour = "$hour";
    }
    if (minute < 10) {
      myMinute = "0$minute";
    } else {
      myMinute = "$minute";
    }
    if (second < 10) {
      mySecond = "0$second";
    } else {
      mySecond = "$second";
    }
    return "$myHour:$myMinute:$mySecond";
  }

  static DateTime stringToDatetimeFormat4(String datetimeString) {
    try {
      return DateFormat(dateFormat4).parse(datetimeString);
    } catch (e) {
      try {
        return DateFormat(dateFormat1).parse(datetimeString);
      } catch (e) {
        return DateFormat(dateFormat2).parse(datetimeString);
      }
    }
  }

  static DateTime stringToDatetimeFormat5(String datetimeString) =>
      DateFormat(dateFormat5).parse(datetimeString);

  static String dateTimeToStringFormat4(DateTime date) =>
      "${date.day}/${date.month}/${date.year} ${date.hour}:${date.minute}:${date.second}";

  static String getTimeAgo({
    required String dateFormat,
    required String dateTimeString,
  }) {
    if (dateTimeString == "error") {
      throw Exception("empty date parameter");
    }
    try {
      return timeago.format(DateFormat(dateFormat).parse(dateTimeString));
    } catch (e) {
      throw Exception(e);
    }
  }

  static String formatDuration(int seconds) {
    final hours = seconds ~/ 3600;
    final minutes = (seconds % 3600) ~/ 60;
    final remainingSeconds = seconds % 60;

    final hoursStr = hours.toString().padLeft(2, '0');
    final minutesStr = minutes.toString().padLeft(2, '0');
    final secondsStr = remainingSeconds.toString().padLeft(2, '0');

    return '$hoursStr:$minutesStr:$secondsStr';
  }

  static void setMessage(String locale) {
    if (locale == "en") {
      timeago.setLocaleMessages('en', DateTimeEnMessages());
    } else {
      timeago.setLocaleMessages('vi', DateTimeViMessages());
    }
    timeago.setDefaultLocale(locale);
  }
}

class DateTimeEnMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'now';
  @override
  String aboutAMinute(int minutes) => '${minutes}m ago';
  @override
  String minutes(int minutes) => '${minutes}m ago';
  @override
  String aboutAnHour(int minutes) => '${minutes}m ago';
  @override
  String hours(int hours) => '${hours}h ago';
  @override
  String aDay(int hours) => '${hours}h ago';
  @override
  String days(int days) => '${days}d ago';
  @override
  String aboutAMonth(int days) => '${days}d ago';
  @override
  String months(int months) => '${months}mo ago';
  @override
  String aboutAYear(int year) => '${year}y ago';
  @override
  String years(int years) => '${years}y ago';
  @override
  String wordSeparator() => ' ';
}

class DateTimeViMessages implements LookupMessages {
  @override
  String prefixAgo() => '';
  @override
  String prefixFromNow() => '';
  @override
  String suffixAgo() => '';
  @override
  String suffixFromNow() => '';
  @override
  String lessThanOneMinute(int seconds) => 'Bây giờ';
  @override
  String aboutAMinute(int minutes) => '${minutes}p trước';
  @override
  String minutes(int minutes) => '${minutes}p trước';
  @override
  String aboutAnHour(int minutes) => '${minutes}p trước';
  @override
  String hours(int hours) => '${hours}g trước';
  @override
  String aDay(int hours) => '${hours}g trước';
  @override
  String days(int days) => '$days ngày trước';
  @override
  String aboutAMonth(int days) => '$days ngày trước';
  @override
  String months(int months) => '$months tháng trước';
  @override
  String aboutAYear(int year) => '$year năm trước';
  @override
  String years(int years) => '$years năm trước';
  @override
  String wordSeparator() => ' ';
}
