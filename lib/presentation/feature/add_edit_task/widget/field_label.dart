import 'package:flutter/material.dart';
import '../../../../core/app_colors.dart';

class FieldLabel extends StatelessWidget {
  const FieldLabel({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: AppColors.bodyText,
        fontWeight: FontWeight.w600,
        fontSize: 12,
      ),
    );
  }
}
