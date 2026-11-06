import 'package:flutter/material.dart';

import '../../../../core/app_colors.dart';

class AppLogo extends StatelessWidget {
  const AppLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 24,
      width: 24,
      decoration: BoxDecoration(
        color: AppColors.primary,
        borderRadius: .circular(8),
      ),
      child: Icon(Icons.check, color: AppColors.background, size: 13),
    );
  }
}
