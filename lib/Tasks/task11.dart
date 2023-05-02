import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class Todo {
  final int id;
  final String todo;
  final bool completed;
  final int userId;

  Todo({
    required this.id,
    required this.todo,
    required this.completed,
    required this.userId,
  });

  factory Todo.fromJson(Map<String, dynamic> json) {
    return Todo(
      id: json['id'],
      todo: json['todo'],
      completed: json['completed'],
      userId: json['userId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'todo': todo,
      'completed': completed,
      'userId': userId,
    };
  }
}

class task11 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter REST API Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TodoListPage(),
    );
  }
}

class TodoListPage extends StatefulWidget {
  @override
  _TodoListPageState createState() => _TodoListPageState();
}

class _TodoListPageState extends State<TodoListPage> {
  late Future<Map<String, dynamic>> _todosFuture;

  @override
  void initState() {
    super.initState();
    _todosFuture = fetchTodos();
  }

  Future<Map<String, dynamic>> fetchTodos() async {
    final response =
    await http.get(Uri.parse('https://dummyjson.com/todos'));

    if (response.statusCode == 200) {
      Map<String, dynamic> todosJson = jsonDecode(response.body);
      return todosJson;
    } else {
      throw Exception('Failed to load todos');
    }
  }

  Future<void> _deleteTodoById(int id) async {
    final response = await http
        .delete(Uri.parse('https://dummyjson.com/todos/$id'));

    if (response.statusCode == 200) {
      setState(() {
        _todosFuture = fetchTodos();
      });
    } else {
      throw Exception('Failed to delete todo');
    }
  }

  Future<void> _toggleTodoCompleted(int id, bool completed) async {
    final response = await http.put(
      Uri.parse('https://dummyjson.com/todos/$id'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'id': id,
        'completed': completed,
      }),
    );

    if (response.statusCode == 200) {
      setState(() {
        _todosFuture = fetchTodos();
      });
    } else {
      throw Exception('Failed to update todo');
    }
  }

  Future<void> _addNewTodo() async {
    final response = await http.post(
      Uri.parse('https://dummyjson.com/todos'),
      headers: <String, String>{'Content-Type': 'application/json'},
      body: jsonEncode(<String, dynamic>{
        'id': DateTime.now().millisecondsSinceEpoch,
        'todo': 'New Todo',
        'completed': false,
        'userId': 1,
      }),
    );

    if (response.statusCode == 201) {
      setState(() {
        _todosFuture = fetchTodos();
      });
    } else {
      throw Exception('Failed to add todo');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        title: Text('Flutter REST API Demo'),
        ),
      body: FutureBuilder<Map<String, dynamic>>(
        future: _todosFuture,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                final todo = snapshot.data![index];
                return ListTile(
                  leading: Checkbox(
                    value: todo.completed,
                    onChanged: (value) {
                      _toggleTodoCompleted(todo.id, value!);
                    },
                  ),
                  title: Text(todo.todo),
                  trailing: IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      _deleteTodoById(todo.id);
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(
              child: Text('${snapshot.error}'),
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addNewTodo,
        child: Icon(Icons.add),
      ),
    );
  }
}
