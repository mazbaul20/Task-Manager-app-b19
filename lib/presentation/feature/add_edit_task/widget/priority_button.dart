import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class PriorityButton extends StatelessWidget {
  const PriorityButton({
    super.key,
    required this.label,
    required this.value,
    required this.isSelected,
    required this.onTap,
  });
  final String label;
  final String value;
  final bool isSelected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        alignment: .center,
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.priorityBackground(label)
              : AppColors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected
                ? AppColors.priorityText(label)
                : AppColors.border,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            label,
            style: TextStyle(
              color: isSelected
                  ? AppColors.priorityText(label)
                  : AppColors.bodyText,
              fontWeight: FontWeight.w600,
              fontSize: 14,
            ),
          ),
        ),
      ),
    );
  }
}
