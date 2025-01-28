
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class CustomTextButton extends StatelessWidget {
  const CustomTextButton({
    super.key,
    required this.text,
    required this.icon,
    required this.onpressed,
    required this.color,
    required this.colorOFIc,
    required this.style,
  });

  final String text;
  final IconData icon;
  final VoidCallback onpressed;
  final Color color;
  final Color colorOFIc;
  final TextStyle style;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: TextButton.styleFrom(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            15.0,
          ), // Optional: rounded corners
        ),
        backgroundColor: color,
        minimumSize: const Size(172, 35),
      ),
      onPressed: onpressed,
      child: Row(
        children: [
          Icon(
            icon,
            color: colorOFIc,
            size: 23.0,
          ),
          const Gap(5),
          Text(
            text,
            style: style,
          ),
        ],
      ),
    );
  }
}
