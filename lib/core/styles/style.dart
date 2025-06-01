import 'package:flutter/material.dart';
import 'package:clean_arch/core/utils/theme.dart';

final nameForm = InputDecoration(hintText: 'Task name...');
final contentForm = InputDecoration(hintText: 'Task content...');
final dateForm = InputDecoration(hintText: 'date');

final textEmpty = TextStyle(fontSize: 35, fontWeight: FontWeight.w500);
final textConfirm = TextStyle(color: appTheme.colorScheme.onPrimary);

final buttonColor = appTheme.colorScheme.onSecondary;
