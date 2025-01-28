import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';
import 'package:feeling_metter/core/constants/app_images.dart';
import 'package:feeling_metter/core/constants/app_text.dart';
import 'package:feeling_metter/provider/form_provider.dart';
import 'package:feeling_metter/provider/select_provider.dart';
import 'package:feeling_metter/core/theme/app_colors.dart';
import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:feeling_metter/screen/view/widgets/custom.coursel.dart';
import 'package:feeling_metter/screen/view/widgets/custom_slider.dart';
import 'package:feeling_metter/screen/view/widgets/notes.dart';
import 'package:feeling_metter/screen/view/widgets/save_button.dart';
import 'package:feeling_metter/screen/view/widgets/diary_custom_app_bar.dart';

class MoodDiaryScreen extends StatelessWidget {
  const MoodDiaryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final carouselProvider = Provider.of<CarouselProvider>(context);
    final moodFormProvider = Provider.of<MoodFormProvider>(context);

    final List<Map<String, String>> items = [
      {'image': AppImages.joy, 'text': AppText.joy},
      {'image': AppImages.fear, 'text': AppText.fear},
      {'image': AppImages.rabies, 'text': AppText.rabies},
      {'image': AppImages.sadness, 'text': AppText.sandess},
      {'image': AppImages.calmness, 'text': AppText.calmness},
      {'image': AppImages.strength, 'text': AppText.strength},
    ];

    void saveMoodData() {
      if (!moodFormProvider.isFormValid) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please fill out all fields before saving."),
          ),
        );
        return;
      }

      final selectedMood = items[carouselProvider.currentIndex]['text'];
      final results = {
        'mood': selectedMood,
        'stressLevel': moodFormProvider.stressLevel,
        'selfEsteem': moodFormProvider.selfEsteem,
        'notes': moodFormProvider.notes,
      };

      print("Saved Results: $results");

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ResultsPage(results: results),
        ),
      );
    }

    return Scaffold(
      appBar: const DiaryCustomAppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            CustomCoursel(items: items, carouselProvider: carouselProvider),
            const Gap(10),
            SizedBox(
              height: 40,
              width: 130,
              child: Card(
                color: AppColors.orange,
                child: Center(
                  child: Text(
                    items[carouselProvider.currentIndex]['text'] ??
                        'Select a mood',
                    style: AppStyles.selectedStyle,
                  ),
                ),
              ),
            ),
            const Gap(15.0),
            CustomSlider(
              title: AppText.stressLevel,
              value: moodFormProvider.stressLevel,
              onChanged: (value) {
                moodFormProvider.updateStressLevel(
                    value); // Update stress level in provider
              },
              minValueLabel: AppText.short,
              maxValueLabel: AppText.high,
            ),
            const Gap(15.0),
            CustomSlider(
              title: AppText.selfesteam,
              value: moodFormProvider.selfEsteem,
              onChanged: (value) {
                moodFormProvider
                    .updateSelfEsteem(value); // Update self-esteem in provider
              },
              minValueLabel: AppText.uncertainty,
              maxValueLabel: AppText.confidence,
            ),
            const Gap(15.0),
            NotesSection(
              notesController: moodFormProvider.notesController,
            ),
            const Gap(15.0),
            SaveButton(
              onPressed: moodFormProvider.isFormValid ? saveMoodData : null,
              isEnabled: moodFormProvider.isFormValid,
            ),
          ],
        ),
      ),
    );
  }
}

class ResultsPage extends StatelessWidget {
  final Map<String, dynamic> results;

  const ResultsPage({super.key, required this.results});

  String getStressLevelDescription(double level) {
    if (level < 30) {
      return 'Low Stress';
    } else if (level < 70) {
      return 'Moderate Stress';
    } else {
      return 'High Stress';
    }
  }

  String getSelfEsteemDescription(double level) {
    if (level < 30) {
      return 'Low Self-Esteem';
    } else if (level < 70) {
      return 'Average Self-Esteem';
    } else {
      return 'High Self-Esteem';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Mood Results"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Mood: ${results['mood']}"),
            const SizedBox(height: 10),
            Text("Stress Level: ${results['stressLevel']}"),
            Text("Description: ${getStressLevelDescription(results['stressLevel'])}"),
            const SizedBox(height: 10),
            Text("Self-Esteem: ${results['selfEsteem']}"),
            Text("Description: ${getSelfEsteemDescription(results['selfEsteem'])}"),
            const SizedBox(height: 10),
            Text("Notes: ${results['notes'] ?? 'No notes provided'}"),
          ],
        ),
      ),
    );
  }
}
