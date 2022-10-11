import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import './todo_model.dart';

class DatabaseConnect {
  Database? _database;

  //create a getter and open a connection to database
  Future<Database> get database async {
    // this is the location of our database in device . ex - data/data/...
    final dbpath = await getDatabasesPath();
    // this is the name of our database;
    const dbname = 'todo.db';

    // this join dbpath and dbname and create full path for database
    // ex - data/data/todo.db
    final path = join(dbpath, dbname);

    // open the connection
    _database = await openDatabase(path, version: 1, onCreate: _createDB);
    //we will create the createDB function separately
    return _database!;
  }

  // the _create db function
  //this create table on our database
  Future<void> _createDB(Database db, int version) async {
    // make sure the column  we created in our table match the todo model field
    await db.execute('''
      CREATE TABLE todo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        creationDate TEXT,
        isChecked INTEGER
      )
    ''');
  }

  // function add data to our database;
  Future<void> insertTodo(Todo todo) async {
    //get the connection to the database
    final db = await database;
    //insert to the todo

    await db.insert(
      'todo', //table name
      todo.toMap(), // the function we created in our todo_model
      conflictAlgorithm:
          ConflictAlgorithm.replace, // this will replace duplicate data
    );
  }

  // function delete data from table
  Future<void> deleteTodo(Todo todo) async {
    //get the connection to the database
    final db = await database;

    //delete the todo from database base on it id
    await db.delete(
      'todo',
      where: 'id==?',
      whereArgs: [todo.id],
    );
  }

  Future<List<Todo>> getTodo() async {
    //get the connection to the database
    final db = await database;
    //query database and save the todo as list of map
    List<Map<String, dynamic>> items = await db.query(
      'todo',
      orderBy: 'id DESC',
    );
    // convert the items from list of map to list of todo;
    return List.generate(
      items.length,
      (i) => Todo(
        id: items[i]['id'],
        title: items[i]['title'],
        creationDate: DateTime.parse(items[i]['creationDate']),
        isChecked: items[i]['isChecked'] == 1 ? true : false,
        // convert int to boolean 1=true, 0=false
      ),
    );
  }
}
