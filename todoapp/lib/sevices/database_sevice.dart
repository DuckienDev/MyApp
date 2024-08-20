import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoapp/models/task_model.dart';

class DatabaseService {
  final String _taskTableName = 'tasks';
  final String _taskIdColumnName = 'id';
  final String _taskContentColumnName = 'content';
  final String _taskStatusColumnName = 'status';
  final String _taskTimeColumnName = 'time';

  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  //INITIALIZE DATABASE
  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  // CREATE DATABASE
  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'todo_app.db');
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        try {
          await db.execute('''
          CREATE TABLE $_taskTableName (
            $_taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $_taskContentColumnName TEXT NOT NULL,
            $_taskStatusColumnName INTEGER NOT NULL,
            $_taskTimeColumnName TEXT NOT NULL
          )
        ''');
          print('Table $_taskTableName created successfully!');
        } catch (e) {
          print('Error creating table: $e');
        }
      },
      onUpgrade: (db, oldVersion, newVersion) {
        if (oldVersion < newVersion) {
          db.execute(
              'ALTER TABLE $_taskTableName ADD COLUMN $_taskTimeColumnName TEXT');
        }
        return;
      },
    );
  }

  // ADD TASK
  void addTodo(String content, String time) async {
    try {
      final db = await database;
      await db.rawInsert(
        'INSERT INTO $_taskTableName ($_taskContentColumnName, $_taskStatusColumnName, $_taskTimeColumnName) VALUES (?, ?, ?)',
        [content, 0, time],
      );
      print('successfully');
    } catch (e) {
      print(e);
      print('error');
    }
  }

  // READ TASK
  Future<List<Task>> getTasks() async {
    try {
      final db = await database;
      final data = await db.query(_taskTableName);
      List<Task> tasks = data
          .map(
            (e) => Task(
              id: e[_taskIdColumnName] as int,
              content: e[_taskContentColumnName] as String,
              status: e[_taskStatusColumnName] as int,
              time: e[_taskTimeColumnName] as String,
            ),
          )
          .toList();
      return tasks;
    } catch (e) {
      print('Error retrieving tasks: $e');
      return []; // Trả về danh sách rỗng nếu có lỗi
    }
  }

  // DELETE TASK
  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      _taskTableName,
      where: '$_taskIdColumnName = ?',
      whereArgs: [id],
    );
  }

  // UPDATE TASK
  void updateTask(int id, int status) async {
    final db = await database;
    await db.update(
      _taskTableName,
      {
        _taskStatusColumnName: status,
      },
      where: '$_taskIdColumnName = ?',
      whereArgs: [id],
    );
  }
}
