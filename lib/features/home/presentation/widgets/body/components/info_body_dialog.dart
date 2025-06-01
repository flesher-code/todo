import 'package:clean_arch/features/home/data/models/task_model.dart';
import 'package:clean_arch/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_arch/core/styles/style.dart';
import 'package:clean_arch/features/home/presentation/widgets/body/components/edit_body_dialog.dart';


class InfoBodyDialog extends StatelessWidget {
  const InfoBodyDialog({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    HomeState homeState = context.watch<HomeState>();
    return AlertDialog(
      title: Text('Menu'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(task.name),
          Text(task.content),
          Text(task.date),
          Text(task.status == 1 ? 'done' : 'not done'),
          SizedBox(height: 5),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              MaterialButton(
                color: buttonColor,
                child: Text('delete'),
                onPressed: () {
                  homeState.delTask(task.id);
                  Navigator.pop(context);
                },
              ),
              SizedBox(width: 12),
              MaterialButton(
                color: buttonColor,
                child: Text('edit'),
                onPressed: () {
                  Navigator.pop(context);
                  showDialog(
                    context: context,
                    builder: (context) => EditBodyDialog(task: task),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
