import 'package:clean_arch/features/home/data/data_source/local/task_local_data_source.dart';
import 'package:flutter/material.dart';

class HomeState with ChangeNotifier {
  final DBService dataBaseService = DBService.instance;

  void switchStatus(int id,int status) {
    dataBaseService.switchStatus(id, status);
    notifyListeners();
  }

  void addTask(
    String name,
    String content,
    String date,
  ) {
    dataBaseService.addTask(name, content, date);
    notifyListeners();
  }

  void updateTask(
    int id,
    String name,
    String content,
    String date,
  ) async {
    dataBaseService.updateTask(id, name, content, date);
    notifyListeners();
  }

  void delTask(int id) {
    dataBaseService.delTask(id);
    notifyListeners();
  } 
}

// import 'package:flutter/material.dart';
// import 'package:clean_arch/features/home/data/models/task_model.dart';
// import 'package:clean_arch/features/home/data/data_source/local/task_local_data_source.dart';

// class HomeProvider with ChangeNotifier {
//   final TaskLocalDataSource _dataSource;
//   List<TaskModel> _tasks = [];
//   bool _isLoading = false;

//   HomeProvider(this._dataSource);

//   List<TaskModel> get tasks => _tasks;
//   bool get isLoading => _isLoading;

//   Future<void> loadTasks() async {
//     _isLoading = true;
//     notifyListeners();
//     _tasks = await _dataSource.getTasks();
//     _isLoading = false;
//     notifyListeners();
//   }

//   Future<void> addTask(TaskModel task) async {
//     await _dataSource.addTask(task);
//     await loadTasks();
//   }

//   Future<void> updateTask(TaskModel task) async {
//     await _dataSource.updateTask(task);
//     await loadTasks();
//   }

//   Future<void> deleteTask(int id) async {
//     await _dataSource.deleteTask(id);
//     await loadTasks();
//   }
// }
