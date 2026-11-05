import 'dart:async';
import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _timer = Timer(Duration(seconds: 2), _goToHome);
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _goToHome() {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (context) => HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      body: Column(
        mainAxisAlignment: .center,
        children: [
          Center(
            child: Container(
              height: 82,
              width: 82,
              decoration: BoxDecoration(
                color: AppColors.primary,
                borderRadius: .circular(24),
                boxShadow: [
                  BoxShadow(color: AppColors.primary.withValues(alpha: 0.32)),
                ],
              ),
              child: Icon(Icons.check, color: AppColors.background, size: 48),
            ),
          ),
          SizedBox(height: 16),
          Text(
            AppStrings.appName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          Text(
            AppStrings.appTagline,
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
          ),
        ],
      ),
    );
  }
}
