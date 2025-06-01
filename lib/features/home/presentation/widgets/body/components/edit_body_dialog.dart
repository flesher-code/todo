import 'package:clean_arch/features/home/data/models/task_model.dart';
import 'package:clean_arch/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_arch/core/styles/style.dart';
import 'package:clean_arch/core/utils/theme.dart';



class EditBodyDialog extends StatelessWidget {
  const EditBodyDialog({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    HomeState homeState = context.watch<HomeState>();

    var nameController = TextEditingController(text: task.name);
    var contentController = TextEditingController(text: task.content);
    var dateController = TextEditingController(text: task.date);

    return AlertDialog(
      title: Text('Edit Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: nameController),
          TextField(controller: contentController),
          TextField(controller: dateController),
          MaterialButton(
            color: appTheme.colorScheme.primary,
            child: Text('save', style: textConfirm),
            onPressed: () {
              homeState.updateTask(
                task.id,
                nameController.text,
                contentController.text,
                dateController.text,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
