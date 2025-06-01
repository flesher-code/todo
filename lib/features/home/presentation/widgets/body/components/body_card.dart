import 'package:clean_arch/core/utils/theme.dart';
import 'package:clean_arch/features/home/data/models/task_model.dart';
import 'package:clean_arch/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_arch/features/home/presentation/widgets/body/components/info_body_dialog.dart';



class BodyCard extends StatelessWidget {
  const BodyCard({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    HomeState homeState = context.watch<HomeState>();
    return Padding(
      padding: const EdgeInsets.only(
        left: 8,
        right: 8,
        top: 6,
      ),
      child: Card(
        child: ListTile(
          leading: Checkbox(
            value: task.status == 1,
            onChanged:
                (value) => homeState.switchStatus(task.id, value! ? 1 : 0),
          ),
          title: Text(
            task.name,
            style: TextStyle(
              decoration: task.status == 1 
              ? TextDecoration.lineThrough
              : TextDecoration.none
            ),
          ),
          trailing: IconButton(
            icon: Icon(
              Icons.info_outline,
              color: colorThemeApp.primary,
            ),
            onPressed: () {
              showDialog(
                context: context, 
                builder: (context) {
                  return InfoBodyDialog(
                    task: task,
                  );
                },
              );
            }, 
          ),
        ),
      ),
    );
  }
}
