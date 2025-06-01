import 'package:clean_arch/features/home/presentation/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:clean_arch/core/styles/style.dart';
import 'package:clean_arch/core/utils/theme.dart';


class AddFloatingDialog extends StatelessWidget {
  const AddFloatingDialog({super.key});

  @override
  Widget build(BuildContext context) {
    HomeState homeState = context.watch<HomeState>();

    var nameController = TextEditingController();
    var contentController = TextEditingController();
    var dateController = TextEditingController();

    return AlertDialog(
      title: Text('Add Task'),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TextField(controller: nameController, decoration: nameForm),
          TextField(controller: contentController, decoration: contentForm),
          TextField(controller: dateController, decoration: dateForm),
          MaterialButton(
            color: appTheme.colorScheme.primary,
            child: Text('done', style: textConfirm),
            onPressed: () {
              homeState.addTask(
                nameController.text == '' ? 'Empty' : nameController.text,
                contentController.text == ''
                    ? 'Something'
                    : contentController.text,
                dateController.text == '' ? '00.00' : dateController.text,
              );
              Navigator.pop(context);
            },
          ),
        ],
      ),
    );
  }
}
