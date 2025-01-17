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

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({
    super.key,
    this.width,
    this.height,
  });

  final double? width;
  final double? height;

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final DateTime _currentDate = DateTime.now();
  DateTime? _selectedDate;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _selectedDate = _currentDate; // Set initial selected date to current date

    // ScrollController to control the initial scroll to the current date
    _scrollController = ScrollController();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _scrollToCurrentDate();
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  // Function to generate a list of dates for the current year
  List<DateTime> _generateDatesForCurrentYear() {
    List<DateTime> dates = [];
    DateTime firstDayOfYear = DateTime(_currentDate.year, 1, 1);
    DateTime lastDayOfYear = DateTime(_currentDate.year, 12, 31);

    for (int i = 0; i <= lastDayOfYear.difference(firstDayOfYear).inDays; i++) {
      dates.add(firstDayOfYear.add(Duration(days: i)));
    }

    return dates;
  }

  // Function to scroll to the current date
  void _scrollToCurrentDate() {
    List<DateTime> dates = _generateDatesForCurrentYear();
    int currentIndex = dates.indexWhere(
      (date) =>
          date.year == _currentDate.year &&
          date.month == _currentDate.month &&
          date.day == _currentDate.day,
    );
    if (currentIndex != -1) {
      // Scroll to the current date
      _scrollController
          .animateTo(
        currentIndex * 53.0, // Approximate width of each item in the list
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      )
          .then((_) {
        // After scrolling is done, update the selected date to highlight it
        setState(() {
          _selectedDate = _currentDate;
        });
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    List<DateTime> dates = _generateDatesForCurrentYear();

    return Scaffold(
      backgroundColor: const Color(0x171819),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                controller: _scrollController, // Attach ScrollController
                scrollDirection: Axis.horizontal,
                itemCount: dates.length,
                itemBuilder: (context, index) {
                  DateTime date = dates[index];

                  bool isSelected =
                      date == _selectedDate; // Check if date is selected
                  String dayNumber = DateFormat('d').format(date);
                  String monthName = DateFormat('MMM').format(date);

                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        _selectedDate = date; // Update the selected date
                      });
                      FFAppState().update(() {
                        FFAppState().reflectionDate =
                            "${DateFormat('d').format(date)}_${DateFormat('M').format(date)}_${DateFormat('y').format(date)}";
                      });
                      safeSetState(() {});
                    },
                    child: Container(
                      width: 43,
                      margin: const EdgeInsets.symmetric(horizontal: 5),
                      decoration: BoxDecoration(
                        color: ((date.day == _currentDate.day &&
                                    date.month == _currentDate.month) ||
                                isSelected)
                            ? const Color(0x6BB8C1B8)
                            : const Color(0x171819), // Highlight selected date
                        borderRadius: BorderRadius.circular(5),
                        border: isSelected
                            ? Border.all(
                                color: const Color(0xFFB8C1B8), width: 2)
                            : null,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            dayNumber,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 1),
                          Text(
                            monthName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
