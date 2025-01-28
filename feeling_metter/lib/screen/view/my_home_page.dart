import 'package:feeling_metter/core/constants/app_text.dart';
import 'package:feeling_metter/core/theme/app_colors.dart';
import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:feeling_metter/screen/view/mood_diary_screen.dart';
import 'package:feeling_metter/screen/view/statistics_screen.dart';
import 'package:feeling_metter/screen/view/widgets/custom_app_bar.dart';
import 'package:feeling_metter/screen/view/widgets/custom_text_button.dart';
import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Track which screen to show
  bool showMoodDiary = true;
  void _toggleScreen(bool isMoodDiary) {
    setState(() {
      showMoodDiary = isMoodDiary; //it will switch between the two screens
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(
          10.0,
        ), //if I have a time  I will make wiht MEdiQuery
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextButton(
                  text: AppText.moodDairy,
                  icon: Icons.book,
                  onpressed: () {
                    _toggleScreen(true);
                  },
                  color: showMoodDiary ? AppColors.orange : AppColors.grey,
                  colorOFIc:
                      showMoodDiary ? AppColors.white : AppColors.darkGrey,
                  style: showMoodDiary
                      ? AppStyles.moodDiary
                      : AppStyles.statistics,
                ),
                CustomTextButton(
                  color: showMoodDiary ? AppColors.grey : AppColors.orange,
                  text: AppText.statistics,
                  icon: Icons.stacked_bar_chart,
                  colorOFIc:
                      showMoodDiary ? AppColors.darkGrey : AppColors.white,
                  style: showMoodDiary
                      ? AppStyles.statistics
                      : AppStyles.moodDiary,
                  onpressed: () {
                    _toggleScreen(false);
                  },
                ),
              ],
            ),
            // Conditional rendering based on which button was pressed
            Expanded(
              child: showMoodDiary
                  ?  const MoodDiaryScreen()
                  : const StatisticsScreen(),
            ),
          ],
        ),
      ),
    );
  }
}
