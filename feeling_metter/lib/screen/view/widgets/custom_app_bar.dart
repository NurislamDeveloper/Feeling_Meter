import 'package:feeling_metter/core/theme/app_colors.dart';
import 'package:feeling_metter/screen/view/calender.dart';
import 'package:feeling_metter/screen/view/widgets/date_time_widget.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Keep the AppBar height consistent

  @override
  Widget build(BuildContext context) {
        double screenWidth = MediaQuery.of(context).size.width; // Get screen width
    double leftPadding = screenWidth * 0.09; 
    double rightPadding = screenWidth * 0.04; 
    return Padding(
      padding: EdgeInsets.only(left: leftPadding,right:rightPadding), // Apply padding
      child: AppBar(
        title: const DateTimeWidget(),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.calendar_month,
              color: AppColors.darkGrey,
              size: 30,
            ),
            onPressed: () {
              // Navigate to CalendarPage when the icon is clicked
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CalendarPage()),
              );
              //
            },
          ),
        ],
      ),
    );
  }
}
