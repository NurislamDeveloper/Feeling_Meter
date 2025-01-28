import 'package:feeling_metter/core/theme/app_styles.dart';
import 'package:flutter/material.dart';

class SaveButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final bool isEnabled;

  const SaveButton({super.key, required this.onPressed, required this.isEnabled});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isEnabled ? onPressed : null, // Disable when not enabled
      style: ElevatedButton.styleFrom(
        backgroundColor: isEnabled ? Colors.orange : Colors.grey, // Dynamic color
      ),
      child:const Text('Save',style:AppStyles.save ,),
    );
  }
}
