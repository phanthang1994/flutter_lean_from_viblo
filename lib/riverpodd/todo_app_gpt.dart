import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class Todo {
  final String title;
  bool isCompleted;

  Todo(this.title, {this.isCompleted = false});
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: TodoApp(),
    );
  }
}

class TodoApp extends HookWidget {
  @override
  Widget build(BuildContext context) {
    // Create a mutable list of todos
    final todos = useState<List<Todo>>([]);

    // Function to add a new todo
    void addTodo() {
      todos.value.add(Todo('New Task'));
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      body: ListView.builder(
        itemCount: todos.value.length,
        itemBuilder: (context, index) {
          final todo = todos.value[index];
          return ListTile(
            title: Text(todo.title),
            trailing: Checkbox(
              value: todo.isCompleted,
              onChanged: (bool? newValue) {
                // Update the completion status of the todo
                todo.isCompleted = newValue ?? false;
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: addTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
