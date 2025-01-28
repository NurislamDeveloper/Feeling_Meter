import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:feeling_metter/screen/viewmodels/home_page.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:provider/provider.dart';

class DateTimeWidget extends StatelessWidget {
  const DateTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageViewModel>(
      builder: (context, value, child) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              value.currentDayAndMonth,
              style: AppStyles.title,
            ),
            const Gap(5.0),
            Text(
              value.currentTime,
              style: AppStyles.title,
            ),
          ],
        );
      },
    );
  }
}
