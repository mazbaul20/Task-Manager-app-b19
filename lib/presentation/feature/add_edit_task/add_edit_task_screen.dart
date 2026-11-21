import 'package:flutter/material.dart';

import '../../../core/app_colors.dart';
import '../../../core/app_strings.dart';
import '../../../core/database_helper.dart';
import '../../../core/task.dart';
import '../../core/square_icon_button.dart';
import 'widget/field_label.dart';
import 'widget/priority_button.dart';
import 'widget/status_tab.dart';
import 'widget/task_text_field.dart';

class AddEditTaskScreen extends StatefulWidget {
  const AddEditTaskScreen({super.key, this.task});

  final Task? task;
  @override
  State<AddEditTaskScreen> createState() => _AddEditTaskScreenState();
}

class _AddEditTaskScreenState extends State<AddEditTaskScreen> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();

  String _dueDate = '';
  String _priority = AppStrings.medium;
  bool _isCompleted = false;
  bool _showTitleError = false;

  bool get _isEditMode => widget.task != null;

  @override
  void initState() {
    super.initState();

    //In Edit mode we put the old values inside the fields
    if (widget.task != null) {
      _titleController.text = widget.task!.title;
      _descriptionController.text = widget.task!.description;
      _dueDate = widget.task!.dueDate;
      _priority = widget.task!.priority;
      _isCompleted = widget.task!.isCompleted;
    }
  }

  String _formatDate(DateTime date) {
    return '${date.day}/${date.month}/${date.year}';
  }

  Future<void> _pickDueDate() async {
    DateTime? pickDate = await showDatePicker(
      context: context,
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );

    if (pickDate == null) return;

    setState(() {
      _dueDate = _formatDate(pickDate);
    });
  }

  Future<void> _onSaveTask() async {
    if (_titleController.text.isEmpty) {
      setState(() {
        _showTitleError = true;
      });
      return;
    }

    DateTime now = DateTime.now();
    Task task = Task(
      id: widget.task?.id,
      title: _titleController.text,
      description: _descriptionController.text,
      dueDate: _dueDate,
      priority: _priority,
      createdDate: _formatDate(now),
      isCompleted: _isCompleted,
    );

    if (_isEditMode) {
      await DatabaseHelper.updateTask(task);
    } else {
      await DatabaseHelper.insertTask(task);
    }
    if (!mounted) return;
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        title: Text(_isEditMode ? AppStrings.editTask : AppStrings.addTask),
        backgroundColor: AppColors.background,
        leading: SquareIconButton(
          icon: Icons.arrow_back,
          onTap: () {
            Navigator.of(context).pop();
          },
        ),
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
                hasError: _showTitleError,
              ),
              FieldLabel(text: AppStrings.description),
              TaskTextField(
                controller: _descriptionController,
                hintText: AppStrings.descriptionHint,
                maxLines: 4,
                hasError: _showTitleError,
              ),

              FieldLabel(text: AppStrings.dueDate),

              GestureDetector(
                onTap: _pickDueDate,
                child: Container(
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
                        child: Text(
                          _dueDate.isEmpty ? AppStrings.dueDate : _dueDate,
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          _pickDueDate();
                        },
                        icon: Icon(Icons.calendar_today),
                      ),
                    ],
                  ),
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
                      isSelected: _priority == AppStrings.low,
                      onTap: () {
                        setState(() {
                          _priority = AppStrings.low;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: PriorityButton(
                      label: AppStrings.medium,
                      value: 'Medium',
                      isSelected: _priority == AppStrings.medium,
                      onTap: () {
                        setState(() {
                          _priority = AppStrings.medium;
                        });
                      },
                    ),
                  ),
                  Expanded(
                    child: PriorityButton(
                      label: AppStrings.high,
                      value: 'High',
                      isSelected: _priority == AppStrings.high,
                      onTap: () {
                        setState(() {
                          _priority = AppStrings.high;
                        });
                      },
                    ),
                  ),
                ],
              ),
              FieldLabel(text: AppStrings.status),
              Container(
                height: 60,
                decoration: BoxDecoration(
                  color: AppColors.softGrey,
                  borderRadius: BorderRadius.circular(9),
                  border: Border.all(color: AppColors.border),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    spacing: 8,
                    children: [
                      Expanded(
                        child: StatusTab(
                          label: AppStrings.pending,
                          isSelected: _isCompleted == false,
                          onTap: () {
                            setState(() {
                              _isCompleted = false;
                            });
                          },
                        ),
                      ),
                      Expanded(
                        child: StatusTab(
                          label: AppStrings.completed,
                          isSelected: _isCompleted == true,
                          onTap: () {
                            setState(() {
                              _isCompleted = true;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Spacer(),
              ElevatedButton(
                onPressed: _onSaveTask,
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
                onPressed: () {
                  Navigator.of(context).pop();
                },
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
