import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:todo_list/database_repo/todoModel.dart';

class AppConst {
  static const String tableName = 'todoTable';
  static const String id = 'id';
  static const String taskName = 'taskName';
  static const String taskDate = 'taskDate';
  static const String startTime = 'startTime';
  static const String endTime = 'endTime';
  static const String description = 'description';
}

class DatabaseRepository {
  Database? _database;

  static final DatabaseRepository instance = DatabaseRepository._init();

  DatabaseRepository._init();

  // database creation

  Future<Database> get todoDatabase async {
    if (_database != null) return _database!;
    _database = await _initDB('todo_list.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);
    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    await db.execute('''
create table ${AppConst.tableName} ( 
  ${AppConst.id} integer primary key autoincrement, 
  ${AppConst.taskName} text not null,
   ${AppConst.taskDate} text not null,
  ${AppConst.startTime} text not null,
  ${AppConst.endTime} text not null,
  ${AppConst.description} text not null)
''');
  }

  // GLOBAL FUNCTION

  // TO INSERT DATA INTO THE DATABASE
  Future<void> insert({required TodoModel todomodel}) async {
    try {
      final db = await todoDatabase;
      db.insert(AppConst.tableName, todomodel.toMap());
      
    } catch (e) {
      print(e.toString());
    }
  }

  //TO RETERIVE DATA FROM THE DATABASE
  Future<List<TodoModel>> getAllTodos() async {
    final db = await instance.todoDatabase;

    final result = await db.query(AppConst.tableName);

    return result.map((json) => TodoModel.fromJson(json)).toList();
  }

  Future<void> delete(int id) async {
    try {
      final db = await instance.todoDatabase;
      await db.delete(
        AppConst.tableName,
        where: '${AppConst.id} = ?',
        whereArgs: [id],
      );
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> update(TodoModel todo) async {
    try {
      final db = await instance.todoDatabase;
      db.update(
        AppConst.tableName,
        todo.toMap(),
        where: '${AppConst.id} = ?',
        whereArgs: [todo.id],
      );
    } catch (e) {
      print(e.toString());
    }
  }
}
