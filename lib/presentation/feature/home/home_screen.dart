import 'package:flutter/material.dart';
import 'package:task_manager_app_b19/presentation/feature/home/widget/app_logo.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import 'widget/filter_button.dart';
import 'widget/stat_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.background,

        title: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            spacing: 12,
            children: [
              AppLogo(),
              Text(
                AppStrings.appName,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                color: AppColors.primary.withAlpha(32),
                borderRadius: .circular(20),
              ),
              child: Icon(Icons.search, color: AppColors.primary),
            ),
          ),
        ],
      ),
      backgroundColor: AppColors.background,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              AppStrings.goodMorning,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.secondaryText,
              ),
            ),
            Text(
              'Mazbaul',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: StatCard(
                    icon: Icons.format_list_bulleted,
                    iconColor: AppColors.primary,
                    count: 0,
                    label: 'Total',
                  ),
                ),
                Expanded(
                  child: StatCard(
                    icon: Icons.schedule,
                    iconColor: AppColors.amberIcon,
                    count: 0,
                    label: 'Pending',
                  ),
                ),
                Expanded(
                  child: StatCard(
                    icon: Icons.check_circle_outline,
                    iconColor: AppColors.greenIcon,
                    count: 0,
                    label: 'Completed',
                  ),
                ),
              ],
            ),
            Row(
              spacing: 10,
              children: [
                Expanded(
                  child: FilterButton(
                    label: "All",
                    isSelected: true,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: FilterButton(
                    label: "Pending",
                    isSelected: false,
                    onTap: () {},
                  ),
                ),
                Expanded(
                  child: FilterButton(
                    label: "Completed",
                    isSelected: false,
                    onTap: () {},
                  ),
                ),
              ],
            ),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: .spaceBetween,
              children: [
                Text("TASKS",style: TextStyle(
                  color: AppColors.secondaryText,
                  fontWeight: .bold,
                  fontSize: 16,
                ),),
                Text("0 tasks",style: TextStyle(
                  color: AppColors.secondaryText,
                  fontWeight: .bold,
                  fontSize: 16,
                ),),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
