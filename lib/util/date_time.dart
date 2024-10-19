import 'package:intl/intl.dart';
import 'package:timeago/timeago.dart' as timeago;
import 'package:timeago/timeago.dart';

class DateTimeHelper {
  static const String dateFormat1 = "yyyy-MM-dd HH:mm:ss";
  static const String dateFormat2 = "yyyy-MM-dd";
  static const String dateFormat3 = "HH:mm dd/MM/yyyy";

  static String formatToHHMM(String dateTime, String dateFormat) {
    if (dateTime == '') {
      return 'Empty date string';
    }
    DateTime chosenTime = DateFormat(dateFormat).parse(dateTime);
    String hour;
    String minute;
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
    return "$hour:$minute";
  }

  static String dateTimeToYMD(DateTime date) =>
      "${date.year}-${date.month}-${date.day}";

  static String dateTimeToDMYhhMMss(DateTime date) =>
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
