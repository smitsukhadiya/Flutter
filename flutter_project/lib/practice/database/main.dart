import 'package:flutter/material.dart';
import 'package:flutter_practical/practice/database/todo.dart';
import 'database_helper.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SQFlite Todo App',
      home: TodoListScreen(),
    );
  }
}

class TodoListScreen extends StatefulWidget {
  @override
  _TodoListScreenState createState() => _TodoListScreenState();
}

class _TodoListScreenState extends State<TodoListScreen> {
  final DatabaseHelper db = DatabaseHelper();
  List<Todo> todos = [];

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  void _loadTodos() async {
    todos = await db.getTodos();
    setState(() {});
  }
  _showAddTodoDialog(BuildContext context) async {
    TextEditingController titleController = TextEditingController();
    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Add Todo'),
          content: TextField(
            controller: titleController,
            autofocus: true,
            decoration: InputDecoration(labelText: 'Title'),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Save'),
              onPressed: () async {
                String title = titleController.text.trim();
                if (title.isNotEmpty) {
                  await db.insertTodo(Todo(title: title));
                  _loadTodos();
                }
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Todo List'),
        ),
        body: ListView.builder(
          itemCount: todos.length,
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(todos[index].title),
              trailing: Checkbox(
                value: todos[index].isDone,
                onChanged: (bool? value) {
                  todos[index].isDone = value!;
                  db.updateTodo(todos[index]);
                  setState(() {});
                },
              ),
              onLongPress: () {
                db.deleteTodo(todos[index].id!);
                _loadTodos();
              },
            );
          },
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _showAddTodoDialog(context);
          },
          child: Icon(Icons.add),
        ),
      );
    }
  }


