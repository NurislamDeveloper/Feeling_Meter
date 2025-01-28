import 'package:feeling_metter/core/constants/app_text.dart';
import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:flutter/material.dart';
class DiaryCustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const DiaryCustomAppBar({
    super.key,
  });
    @override
      Size get preferredSize => const Size.fromHeight(kToolbarHeight); // Keep the AppBar height consistent


  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        AppText.whatDoYouFeel,
        style: AppStyles.whatDOYouFeel,
      ),
    );
  }
}