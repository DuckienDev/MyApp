import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:todoapp/models/task_model.dart';

class DatabaseService {
  final String _taskTableName = 'tasks';
  final String _taskIdColumnName = 'id';
  final String _taskContentColumnName = 'content';
  final String _taskStatusColumnName = 'status';

  static Database? _db;
  static final DatabaseService instance = DatabaseService._constructor();
  DatabaseService._constructor();

  //CHECK TABLE
  Future<Database> get database async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await getDatabase();
      return _db!;
    }
  }

  // CREATE TABLE
  Future<Database> getDatabase() async {
    final databaseDirPath = await getDatabasesPath();
    final databasePath = join(databaseDirPath, 'todo_db.db');
    return openDatabase(
      databasePath,
      version: 1,
      onCreate: (db, version) async {
        try {
          await db.execute('''
          CREATE TABLE $_taskTableName (
            $_taskIdColumnName INTEGER PRIMARY KEY AUTOINCREMENT,
            $_taskContentColumnName TEXT NOT NULL,
            $_taskStatusColumnName INTEGER NOT NULL
          )
        ''');
          print('Table $_taskTableName created successfully');
        } catch (e) {
          print('Error creating table: $e');
        }
      },
      onUpgrade: (db, oldVersion, newVersion) {
        // Xử lý nâng cấp nếu cần
      },
    );
  }

  // ADD TASK
  void addTodo(String content) async {
    final db = await database;
    await db.rawInsert(
      'INSERT INTO $_taskTableName ($_taskContentColumnName, $_taskStatusColumnName) VALUES (?, ?)',
      [content, 0],
    );
  }

  // READ TASK
  Future<List<Task>> getTasks() async {
    final db = await database;
    final data = await db.query(_taskTableName);
    List<Task> tasks = data
        .map(
          (e) => Task(
            id: e[_taskIdColumnName] as int,
            content: e[_taskContentColumnName] as String,
            status: e[_taskStatusColumnName] as int,
          ),
        )
        .toList();
    return tasks;
  }

  // DELETE TASK
  Future<void> deleteTodo(int id) async {
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
