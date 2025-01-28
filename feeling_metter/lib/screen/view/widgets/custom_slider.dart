import 'package:feeling_metter/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:gap/gap.dart';

class CustomSlider extends StatelessWidget {
  final String title;
  final double value;
  final ValueChanged<double> onChanged;
  final String minValueLabel;
  final String maxValueLabel;

  const CustomSlider({
    super.key,
    required this.title,
    required this.value,
    required this.onChanged,
    required this.minValueLabel,
    required this.maxValueLabel,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Card(
        elevation: 4,
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.12,
          width: MediaQuery.of(context).size.width * 0.9,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Gap(5.0),
              Text(
                title,
                style: AppStyles.whatDOYouFeel,
              ),
              Slider(
                thumbColor: AppColors.orange,
                activeColor: AppColors.orange,
                value: value,
                min: 0,
                max: 100,
                onChanged: onChanged,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(minValueLabel, style: AppStyles.textForRate),
                  const Gap(40),
                  Text(maxValueLabel, style: AppStyles.textForRate),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
