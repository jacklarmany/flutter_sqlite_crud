import 'package:flutter/material.dart';
import './models/db_model.dart';
import './models/todo_model.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var db = DatabaseConnect();
  //insert data to database;
  await db.insertTodo(Todo(
    id: 1,
    title: 'this is sample data',
    creationDate: DateTime.now(),
    isChecked: false,
  ));
  // print(await db.getTodo());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text("Todo"),
        ),
        body: const Center(
          child: Text("ddd"),
        ),
      ),
    );
  }
}
