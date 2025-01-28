import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  _CalendarPageState createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now(); // Set the current day as the focused day
    _selectedDay = _focusedDay; // Initially select the current day
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 30.0),
            child: Text(
              'Calender',
              style: AppStyles.actionsCalender,
            ),
          ),
        ],
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context); // Go back to the previous screen
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Use Expanded to allow the calendar to fill available space
            Expanded(
              child: TableCalendar(
                firstDay: DateTime.utc(2020, 1, 1),
                lastDay: DateTime.utc(2025, 12, 31),
                focusedDay: _focusedDay,
                selectedDayPredicate: (day) {
                  // Highlight the selected day
                  return isSameDay(_selectedDay, day);
                },
                onDaySelected: (selectedDay, focusedDay) {
                  // Update selected and focused days
                  setState(() {
                    _selectedDay = selectedDay;
                    _focusedDay = focusedDay;
                  });
                },
                onPageChanged: (focusedDay) {
                  // Update the focused day when the page changes (month changes)
                  setState(() {
                    _focusedDay = focusedDay;
                  });
                },
                calendarStyle: const CalendarStyle(
                  todayDecoration: BoxDecoration(
                    color: Colors.blue, // Color for today
                    shape: BoxShape.circle,
                  ),
                  selectedDecoration: BoxDecoration(
                    color: Colors.orange, // Color for selected day
                    shape: BoxShape.circle,
                  ),
                  defaultTextStyle: TextStyle(
                    fontSize: 22,
                  ), // Adjust day font size
                  weekendTextStyle: TextStyle(
                    fontSize: 22,
                  ), // Adjust weekend day font size
                ),
                headerStyle: const HeaderStyle(
                  formatButtonVisible:
                      false, // Hide the format button (day/month switch)
                  titleCentered: true, // Center the title
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
