import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() =>  initializeDateFormatting().then((_) => runApp(CalendarApp()));

class CalendarApp extends StatelessWidget {
  const CalendarApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home : CalendarExam()
    );
  }
}

class CalendarExam extends StatefulWidget {
  const CalendarExam({super.key});

  @override
  State<CalendarExam> createState() => _CalendarExamState();
}

class _CalendarExamState extends State<CalendarExam> {
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title : Text("달력")),
      body : TableCalendar(
        locale: 'ko_KR',
        firstDay: DateTime.utc(2010, 10, 16),
        lastDay: DateTime.utc(2030, 3, 14),
        focusedDay: _focusedDay,
        selectedDayPredicate: (day) {
          return isSameDay(_selectedDay, day);
        },
        onDaySelected: (selectedDay, focusedDay) {
          setState(() {
            _selectedDay = selectedDay;
            _focusedDay = focusedDay; // update `_focusedDay` here as well
          });
        },
      )
    );
  }
}
