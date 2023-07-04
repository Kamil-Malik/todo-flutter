import 'package:flutter/material.dart';
import 'package:todoapp/ui/add_todo.dart';
import 'package:todoapp/ui/detail_screen.dart';

import '../model/todos_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _todos = [
    Todo(todoTitle: 'Wakeup early', todoSubtitle: 'Wakeup at 5AM'),
    Todo(todoTitle: 'Breakfast', todoSubtitle: 'Having breakfast'),
    Todo(
        todoTitle: 'Prepare for Work',
        todoSubtitle: 'Prepare every needs for work including coffee')
  ];

  _addTodo() async {
    final result = await showDialog(
        context: context, builder: (context) => const AddTodo());
    if (result.todoTitle.isEmpty || result.todoSubtitle.isEmpty) {
      return;
    } else {
      setState(() => _todos.add(result));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App Udemy Course V3'),
      ),
      body: ListView.separated(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo.todoTitle,
                softWrap: true,
                style: TextStyle(
                    decoration:
                        todo.todoStatus ? TextDecoration.lineThrough : null,
                    decorationColor: Colors.black)),
            leading: IconButton(
              tooltip: 'Todo Status',
              icon: Icon(todo.todoStatus ? Icons.check : Icons.close,
                  color: todo.todoStatus ? Colors.green : Colors.red),
              onPressed: () => setState(
                  () => todo.todoStatus = todo.todoStatus ? false : true),
            ),
            trailing: IconButton(
              tooltip: 'Delete Todo',
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () => setState(() => _todos.remove(todo)),
            ),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailScreen(
                            todo: todo,
                          )));
            },
            contentPadding: const EdgeInsets.fromLTRB(4, 8, 4, 8),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const Divider();
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _addTodo,
        tooltip: 'Add new Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
