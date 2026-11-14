import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../../core/square_icon_button.dart';
import 'widget/field_label.dart';
import 'widget/priority_button.dart';
import 'widget/status_tab.dart';
import 'widget/task_text_field.dart';

class AddEditTaskScreen extends StatefulWidget {
  const AddEditTaskScreen({super.key});

  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(AppStrings.addTask),
        backgroundColor: AppColors.background,
        leading: SquareIconButton(icon: Icons.arrow_back, onTap: () {}),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            spacing: 8,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FieldLabel(text: AppStrings.taskTitle),
              TaskTextField(
                controller: _titleController,
                hintText: AppStrings.taskTitleHint,
              ),
              FieldLabel(text: AppStrings.description),
              TaskTextField(
                controller: _descriptionController,
                hintText: AppStrings.descriptionHint,
                maxLines: 4,
              ),

              FieldLabel(text: AppStrings.dueDate),
              Container(
                height: 48,
                decoration: BoxDecoration(
                  color: AppColors.white,
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(color: AppColors.border),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text('dd/mm/yyyy'),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: Icon(Icons.calendar_today),
                    ),
                  ],
                ),
              ),
              FieldLabel(text: AppStrings.priority),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: PriorityButton(
                      label: AppStrings.low,
                      value: 'Law',
                      isSelected: false,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: PriorityButton(
                      label: AppStrings.medium,
                      value: 'Medium',
                      isSelected: true,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: PriorityButton(
                      label: AppStrings.high,
                      value: 'High',
                      isSelected: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              FieldLabel(text: AppStrings.status),
              Row(
                spacing: 8,
                children: [
                  Expanded(
                    child: StatusTab(
                      label: AppStrings.status,
                      isSelected: true,
                      onTap: () {},
                    ),
                  ),
                  Expanded(
                    child: StatusTab(
                      label: AppStrings.status,
                      isSelected: false,
                      onTap: () {},
                    ),
                  ),
                ],
              ),
              Spacer(),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  minimumSize: Size(double.infinity, 48),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(11),
                  ),
                ),
                child: Text(
                  AppStrings.saveTask,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: AppColors.white,
                  ),
                ),
              ),
              TextButton(
                onPressed: () {},
                child: Center(
                  child: Text(
                    AppStrings.cancel,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.bodyText,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
