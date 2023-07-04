import 'package:flutter/material.dart';
import 'package:todoapp/model/todos_model.dart';

class AddTodo extends StatefulWidget {
  const AddTodo({super.key});

  @override
  State createState() => _AddTodoState();
}

class _AddTodoState extends State<AddTodo> {
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();

  _finish() {
    final todo = Todo(
        todoTitle: titleController.text,
        todoSubtitle: descriptionController.text);
    Navigator.pop(context, todo);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      content: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
        child: Column(
          children: [
            TextField(
                controller: titleController,
                decoration: const InputDecoration(
                  icon: Icon(Icons.title),
                  label: Text('Todo Title'),
                  hintText: 'Washing Dishes',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(4)),
                  ),
                )),
            const SizedBox(
              height: 16,
            ),
            TextField(
              controller: descriptionController,
              decoration: const InputDecoration(
                icon: Icon(Icons.description),
                label: Text('Todo Description'),
                hintText: 'Wash the dishes after having lunch',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                ),
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            Center(
              child: Row(
                children: [
                  FilledButton(
                    onPressed: _finish,
                    style: FilledButton.styleFrom(
                        backgroundColor: Colors.green,
                        surfaceTintColor: Colors.white,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(4)))),
                    child: const Text('Add Todo'),
                  ),
                  const SizedBox(width: 16),
                  FilledButton(
                      onPressed: _finish,
                      style: FilledButton.styleFrom(
                          backgroundColor: Colors.redAccent,
                          surfaceTintColor: Colors.white,
                          shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(4)))),
                      child: const Text('Cancel'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();
    super.dispose();
  }
}
