import 'package:flutter/material.dart';
import 'package:task_manager_app_b19/presentation/core/square_icon_button.dart';
import 'package:task_manager_app_b19/presentation/feature/add_edit_task/add_edit_task_screen.dart';

class TaskDetailsScreen extends StatefulWidget {
  const TaskDetailsScreen({super.key});

  @override
  State<TaskDetailsScreen> createState() => _TaskDetailsScreenState();
}

class _TaskDetailsScreenState extends State<TaskDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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

      body: Text("Task details page"),
    );
  }
}
