// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:health_app_flutter/util/styles.dart';
import 'package:table_calendar/table_calendar.dart';

class MyCalendar extends StatefulWidget {
  const MyCalendar({
    super.key,
    required this.firstDate,
    required this.focusedDate,
  });

  final DateTime firstDate;
  final DateTime focusedDate;

  @override
  State<MyCalendar> createState() => _MyCalendarState();
}

class _MyCalendarState extends State<MyCalendar> {
  bool _isSameDay(DateTime a, DateTime b) =>
      a.year == b.year && a.month == b.month && a.day == b.day;

  bool _isBetween(DateTime target, DateTime start, DateTime end) {
    return (target.day >= start.day &&
            target.month >= start.month &&
            target.year >= start.year) &&
        (target.day <= end.day &&
            target.month <= end.month &&
            target.year <= end.year);
  }

  CalendarFormat _calendarFormat = CalendarFormat.week;

  @override
  Widget build(BuildContext context) {
    // debugPrint("focusedDate : ${widget.focusedDate}");
    return TableCalendar(
      firstDay: DateTime.utc(
        widget.firstDate.year,
        widget.firstDate.month,
        widget.firstDate.day,
      ),
      lastDay: DateTime.utc(
        DateTime.now().year,
        DateTime.now().month,
        DateTime.now().day,
      ),
      currentDay: widget.focusedDate,
      focusedDay: widget.focusedDate,
      // focusedDay: widget.focusedDate,
      rangeSelectionMode: RangeSelectionMode.disabled,
      pageAnimationEnabled: true,
      calendarFormat: _calendarFormat,
      availableCalendarFormats: const {
        CalendarFormat.week: 'Week',
        CalendarFormat.month: 'Month',
      },
      headerStyle: HeaderStyle(
        titleTextStyle: AppStyles.f20sb().copyWith(
          color: "e0e0e0".toColor(),
        ),
        formatButtonTextStyle: AppStyles.f16m().copyWith(
          color: "e0e0e0".toColor(),
        ),
        // formatButtonVisible: false,
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekdayStyle: AppStyles.f14m().copyWith(color: "e0e0e0".toColor()),
        weekendStyle: AppStyles.f14m().copyWith(color: "e0e0e0".toColor()),
      ),
      calendarStyle: CalendarStyle(
        weekendTextStyle: AppStyles.f13m().copyWith(color: "e0e0e0".toColor()),
        weekendDecoration: BoxDecoration(
          // color: Colors.red,
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        defaultTextStyle: AppStyles.f13m().copyWith(color: "e0e0e0".toColor()),
        defaultDecoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        disabledTextStyle: AppStyles.f13m().copyWith(color: Colors.black),
        disabledDecoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        selectedTextStyle: AppStyles.f13sb().copyWith(color: Colors.black),
        selectedDecoration: BoxDecoration(
          color: Colors.blue[900],
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        todayTextStyle: AppStyles.f13m().copyWith(color: "e0e0e0".toColor()),
        todayDecoration: BoxDecoration(
          // color: Colors.blue[100],
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        holidayTextStyle: AppStyles.f13m().copyWith(color: Colors.black),
        holidayDecoration: BoxDecoration(
          // color: Colors.blue[100],
          borderRadius: BorderRadius.circular(15),
          shape: BoxShape.rectangle,
        ),
        outsideDaysVisible: false,
      ),
      onFormatChanged: (format) {
        setState(() {
          _calendarFormat = format;
        });
      },
      selectedDayPredicate: (day) {
        // debugPrint("_isSameDay: ${_isSameDay(day, widget.focusedDate)}");
        return _isSameDay(day, widget.focusedDate);
      },
      onDaySelected: (selectedDay, focusedDay) {
        bool isInTimeLine =
            _isBetween(selectedDay, widget.firstDate, DateTime.now());
        if (!_isSameDay(selectedDay, widget.focusedDate) && isInTimeLine) {

          
        }
      },
    );
  }
}
