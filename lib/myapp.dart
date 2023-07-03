import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:todoapp/model/todos_model.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _todos = [
    Todo('Wakeup early', 'Wakeup at 5AM', true),
    Todo('Breakfast', 'Having breakfast', false),
    Todo('Prepare for Work', 'Prepare every needs for work including coffee',
        false)
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
            ),
            actions: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FilledButton(
                      onPressed: () {
                        setState(() {
                          _todos.add(Todo(titleController.text,
                              subtitleController.text, false));
                        });
                        Navigator.of(context).pop();
                      },
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.green,
                          surfaceTintColor: Colors.white
                      ),
                      child: const Text('Add Todo')),
                  FilledButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    style: FilledButton.styleFrom(
                        backgroundColor: Theme.of(context).colorScheme.error,
                        surfaceTintColor: Theme.of(context).colorScheme.onError
                    ),
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
        title: const Text('Todo App Udemy Course V1'),
      ),
      body: ListView.separated(
        itemCount: _todos.length,
        itemBuilder: (context, index) {
          final todo = _todos[index];
          return ListTile(
            title: Text(todo.todoTitle),
            subtitle: Text(todo.todoSubtitle),
            leading: IconButton(
              icon: Icon(todo.todoStatus ? Icons.check : Icons.close),
              onPressed: () =>
                  setState(() {
                    _todos[index].todoStatus = todo.todoStatus ? false : true;
                  }),
            ),
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () =>
                    setState(() {
                      _todos.remove(todo);
                    })),
            onTap: () {},
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
