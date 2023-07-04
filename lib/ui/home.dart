import 'package:flutter/material.dart';
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

  _showDialog() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          TextEditingController titleController = TextEditingController();
          TextEditingController subtitleController = TextEditingController();

          return AlertDialog(
            title: const Text('Add new Todo'),
            content: IntrinsicHeight(
                child: SizedBox(
              width: double.maxFinite,
              child: Column(
                children: [
                  TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: titleController,
                      decoration: const InputDecoration(
                          hintText: 'Todo Title',
                          icon: Icon(Icons.title),
                          label: Text('Insert Todo Title'),
                          border: OutlineInputBorder())),
                  const SizedBox(height: 16),
                  TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    controller: subtitleController,
                    decoration: const InputDecoration(
                        hintText: 'Todo Subtitles',
                        icon: Icon(Icons.subtitles),
                        label: Text('Insert Todo Subtitle'),
                        border: OutlineInputBorder()),
                  )
                ],
              ),
            )),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                      onPressed: () {
                        setState(() {
                          _todos.add(Todo(
                              todoTitle: titleController.text,
                              todoSubtitle: subtitleController.text));
                        });
                        Navigator.of(context).pop();
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          surfaceTintColor: Colors.white),
                      child: const Text('Add Todo')),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        surfaceTintColor:
                            Theme.of(context).colorScheme.onError),
                    child: const Text('Cancel'),
                  )
                ],
              )
            ],
            icon: const Icon(Icons.task),
          );
        });
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
              onPressed: () => setState(() {
                _todos[index].todoStatus = todo.todoStatus ? false : true;
              }),
            ),
            trailing: IconButton(
              tooltip: 'Delete Todo',
              icon: const Icon(
                Icons.delete,
                color: Colors.redAccent,
              ),
              onPressed: () => setState(() {
                _todos.remove(todo);
              }),
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
        onPressed: () => _showDialog(),
        tooltip: 'Add new Todo',
        child: const Icon(Icons.add),
      ),
    );
  }
}
