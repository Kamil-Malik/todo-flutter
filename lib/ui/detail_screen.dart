import 'package:flutter/material.dart';
import 'package:todoapp/model/todos_model.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.todo}) : super(key: key);

  final Todo todo;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Todo'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(
              todo.todoTitle,
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 12,
            ),
            Text(todo.todoSubtitle),
            Text('Todo is ${todo.todoStatus ? 'Done' : 'In Progress'}')
          ],
        ),
      ),
    );
  }
}
