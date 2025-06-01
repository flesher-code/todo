class TaskModel {
  final int id;
  final int status;
  String name;
  final String content;
  final String date;

  TaskModel({
    required this.id,
    required this.status,
    required this.name,
    required this.content,
    required this.date,
  });
}

// class TaskModel {
//   final int id;
//   final int status;
//   final String name;
//   final String content;
//   final String date;

//   TaskModel({
//     required this.id,
//     required this.status,
//     required this.name,
//     required this.content,
//     required this.date,
//   });

//   // Конвертация из Map (из БД)
//   factory TaskModel.fromMap(Map<String, dynamic> map) {
//     return TaskModel(
//       id: map['id'] as int,
//       status: map['status'] as int,
//       name: map['name'] as String,
//       content: map['content'] as String,
//       date: map['date'] as String,
//     );
//   }

//   // Конвертация в Map (для вставки в БД)
//   Map<String, dynamic> toMap() {
//     return {
//       'id': id,
//       'status': status,
//       'name': name,
//       'content': content,
//       'date': date,
//     };
//   }
// }
