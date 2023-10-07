import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

void main() {
  runApp(const MyApp());
}

class Todo {
  final int id;
  final String title;

  Todo({
    required this.id,
    required this.title,
  });
}

class TodoDatabase {
  late Database _database;

  Future<void> open() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'todo_database.db'),
      onCreate: (db, version) {
        return db.execute(
          'CREATE TABLE todos(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT)',
        );
      },
      version: 1,
    );
  }

  Future<int> insert(Todo todo) async {
    return await _database.insert('todos', {
      'title': todo.title,
    });
  }

  Future<List<Todo>> getTodos() async {
    final List<Map<String, dynamic>> maps = await _database.query('todos');

    return List.generate(maps.length, (i) {
      return Todo(
        id: maps[i]['id'],
        title: maps[i]['title'],
      );
    });
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _todoController = TextEditingController();
  final TodoDatabase _database = TodoDatabase();

  List<Todo> _todos = [];

  @override
  void initState() {
    super.initState();
    _initializeDatabase();
  }

  Future<void> _initializeDatabase() async {
    await _database.open();
    _refreshTodoList();
  }

  Future<void> _refreshTodoList() async {
    final todos = await _database.getTodos();
    setState(() {
      _todos = todos;
    });
  }

  Future<void> _addTodo() async {
    final title = _todoController.text;
    if (title.isNotEmpty) {
      await _database.insert(Todo(id: 0, title: title));
      _todoController.clear();
      _refreshTodoList();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App with SQLite'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _todoController,
              decoration: const InputDecoration(
                hintText: 'Enter a todo',
              ),
            ),
            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: _addTodo,
              child: const Text('Add Todo'),
            ),
            const SizedBox(height: 32.0),
            ListView.builder(
              shrinkWrap: true,
              itemCount: _todos.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(_todos[index].title),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
