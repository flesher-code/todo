import 'package:clean_arch/features/home/data/models/task_model.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBService {
  static Database? _db;

  static final DBService instance = DBService._constructor();
  DBService._constructor();

  final String _taskTableName = 'tasks';
  final String _taskId = 'id';
  final String _taskStatus = 'status';
  final String _taskName = 'name';
  final String _taskContent = 'content';
  final String _taskEndDate = 'date';

  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await getDatabase();
    return _db!;
  }

  Future<Database> getDatabase() async {
    final dbDirPath = await getDatabasesPath();
    final dbPath = join(dbDirPath,'master.db');
    final database = openDatabase(
      dbPath,
      version: 1,
      onCreate: (db, version) {
        db.execute('''
        CREATE TABLE $_taskTableName (
        $_taskId INTEGER PRIMARY KEY,
        $_taskStatus INTEGER NOT NULL,
        $_taskName TEXT NOT NULL,
        $_taskContent TEXT NOT NULL,
        $_taskEndDate TEXT NOT NULL
        )
        ''');
      },
    );
    return database;
  }

  Future<List<TaskModel>> getTasks() async {
    final db = await database;
    final data = await db.query(_taskTableName);
    List<TaskModel> tasks = data.map(
      (e) => TaskModel(
        id: e['id'] as int,
        status: e['status'] as int,
        name: e['name'] as String,
        content: e['content'] as String,
        date: e['date'] as String,
      )
    ).toList();
    return tasks;
  }

  void addTask(
    String name,
    String content,
    String date,
  ) async {
    final db = await database;
    await db.insert(_taskTableName, {
      _taskName : name,
      _taskStatus : 0,
      _taskContent : content,
      _taskEndDate : date,
    });
  }

  void updateTask(
    int id,
    String name,
    String content,
    String date,
  ) async {
    final db = await database;
    await db.update(_taskTableName, {
      _taskName : name,
      _taskContent : content,
      _taskEndDate : date,
    }, 
    where: 'id = ?',
    whereArgs: [id],
    );
  }

  void delTask(int id) async {
    final db = await database;
    await db.delete(
      _taskTableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  void switchStatus(int id, int status) async {
    final db = await database;
    await db.update(_taskTableName, 
    { _taskStatus : status },
    where: 'id = ?',
    whereArgs: [id],
    );
  }
}
