// Automatic FlutterFlow imports
import '/backend/backend.dart';
import '/backend/schema/structs/index.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'index.dart'; // Imports other custom widgets
import '/custom_code/actions/index.dart'; // Imports custom actions
import '/flutter_flow/custom_functions.dart'; // Imports custom functions
import 'package:flutter/material.dart';
// Begin custom widget code
// DO NOT REMOVE OR MODIFY THE CODE ABOVE!

import 'package:table_calendar/table_calendar.dart';

class CustomCalendarScreen extends StatefulWidget {
  const CustomCalendarScreen({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CustomCalendarScreen> createState() => _CustomCalendarScreenState();
}

class _CustomCalendarScreenState extends State<CustomCalendarScreen> {
  final ScrollController _scrollController = ScrollController();
  final DateTime _currentDate = DateTime.now();
  final List<String> _daysOfWeek = ['Mo', 'Tu', 'We', 'Th', 'Fr', 'Sa', 'Su'];

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentMonth();
    });
  }

  // Automatically scroll to the current month
  void _scrollToCurrentMonth() {
    int currentMonthIndex = _currentDate.month - 1;
    double scrollOffset =
        currentMonthIndex * 400.0; // Adjust height if necessary
    _scrollController.animateTo(
      scrollOffset,
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF111010), // Dark background color
      body: ListView.builder(
        controller: _scrollController,
        itemCount: 12, // One for each month
        itemBuilder: (context, index) {
          DateTime monthDate = DateTime(_currentDate.year, index + 1, 1);
          return Padding(
            padding:
                const EdgeInsets.only(bottom: 32.0, left: 15.0, right: 15.0),
            child: Container(
              width: 360,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: const Color(0xFF1C1E1F), width: 2)),
              child: _buildMonthWidget(
                monthDate,
              ),
            ),
          );
        },
      ),
    );
  }

  // Build the calendar for each month
  Widget _buildMonthWidget(DateTime monthDate) {
    String monthName = DateFormat.MMMM().format(monthDate); // Get month name

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Month and year display
          Text(
            "$monthName ${monthDate.year}",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 16),
          // Days of the week (Mon, Tue, etc.)
          _buildDaysOfWeek(),
          const SizedBox(height: 8),
          // Calendar grid for the month
          _buildMonthGrid(monthDate),
        ],
      ),
    );
  }

  // Build the days of the week (Mon, Tue, etc.)
  Widget _buildDaysOfWeek() {
    return GridView.count(
      crossAxisCount: 7, // 7 days in a week
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: _daysOfWeek
          .map((day) => Center(
                child: Text(
                  day,
                  style: TextStyle(
                    color:
                        Colors.white.withOpacity(0.7), // Days of the week color
                    fontSize: 16.0,
                  ),
                ),
              ))
          .toList(),
    );
  }

  // Build the grid of days for the month
  Widget _buildMonthGrid(DateTime monthDate) {
    int daysInMonth = DateUtils.getDaysInMonth(monthDate.year, monthDate.month);
    int firstDayOffset =
        DateTime(monthDate.year, monthDate.month, 1).weekday - 1;

    List<Widget> dayWidgets = [];

    // Add empty widgets for days before the first day of the month
    for (int i = 0; i < firstDayOffset; i++) {
      dayWidgets.add(SizedBox());
    }

    // Add day widgets for each day in the month
    for (int i = 1; i <= daysInMonth; i++) {
      DateTime day = DateTime(monthDate.year, monthDate.month, i);
      dayWidgets.add(_buildDayWidget(day));
    }

    // Display the days in a grid format
    return GridView.count(
      crossAxisCount: 7, // 7 days in a week
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: dayWidgets,
    );
  }

  // Build each day widget (circular design)
  Widget _buildDayWidget(DateTime day) {
    bool isToday = isSameDay(day, _currentDate);

    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: isToday ? Colors.grey[800] : Colors.transparent,
          border: isToday
              ? Border.all(color: Colors.white.withOpacity(0.8), width: 2)
              : Border.all(color: Colors.white.withOpacity(0.2)),
        ),
        alignment: Alignment.center,
        child: Text(
          "${day.day}",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: isToday ? FontWeight.bold : FontWeight.normal,
          ),
        ),
      ),
    );
  }

  // Helper function to check if two dates are the same day
  bool isSameDay(DateTime day1, DateTime day2) {
    return day1.year == day2.year &&
        day1.month == day2.month &&
        day1.day == day2.day;
  }
}
