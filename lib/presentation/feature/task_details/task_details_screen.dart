import 'package:flutter/material.dart';
import 'package:task_manager_app_b19/presentation/core/square_icon_button.dart';
import 'package:task_manager_app_b19/presentation/feature/add_edit_task/add_edit_task_screen.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import 'widget/action_button.dart';
import 'widget/info_pill.dart';
import 'widget/info_row.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        leading: SquareIconButton(icon: Icons.arrow_back, onTap: () {}),
        title: const Text('Task Details'),
        actions: [
          SizedBox(
            height: 55,
            width: 55,
            child: SquareIconButton(
              icon: Icons.edit_outlined,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddEditTaskScreen()),
                );
              },
            ),
          ),
        ],
      ),

      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(32),
                    blurRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 16,
                  children: [
                    Row(
                      spacing: 8,
                      children: [
                        InfoPill(
                          text: "High Priority",
                          textColor: AppColors.red,
                          backgroundColor: AppColors.red.withAlpha(50),
                        ),
                        InfoPill(
                          text: "Pending",
                          textColor: AppColors.primary,
                          backgroundColor: AppColors.primary.withAlpha(50),
                        ),
                      ],
                    ),
                    Text(
                      'Submit project report',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    InfoRow(
                      icon: Icons.calendar_month,
                      label: 'Due Date',
                      value: '2023-10-15',
                      valueColor: AppColors.red,
                    ),
                    InfoRow(
                      icon: Icons.alarm,
                      label: "Due Date",
                      value: "2023-10-15",
                      valueColor: AppColors.primaryText,
                    ),
                  ],
                ),
              ),
            ),
            Text(
              AppStrings.description,
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w700,
                color: AppColors.primaryText,
              ),
            ),
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(11),
                boxShadow: [
                  BoxShadow(
                    color: AppColors.primary.withAlpha(32),
                    blurRadius: 4,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Text(
                "Compile Q3 metrics across acquisition, retention, and revenue, then send the summary deck to the finance team ahead of Friday's leadership review.",
                style: TextStyle(fontSize: 12, color: AppColors.labelText),
              ),
            ),

            ActionButton(
              icon: Icons.done,
              label: 'Mark as Completed',
              textColor: AppColors.primary,
              borderColor: AppColors.primary,
              backgroundColor: AppColors.primary,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddEditTaskScreen()),
                );
              },
            ),

            ActionButton(
              icon: Icons.delete_outline,
              label: 'Delete Task',
              textColor: AppColors.red,
              borderColor: AppColors.red,
              backgroundColor: AppColors.red,
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (context) => AddEditTaskScreen()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
