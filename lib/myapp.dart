import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
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
  final _persons = ['First Person', 'Second Person', 'Third Person'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Todo App Udemy Course V1'),
      ),
      body: ListView.builder(
        itemCount: _persons.length,
        itemBuilder: (context, index) {
          final person = _persons[index];
          return ListTile(
            title: Text(person),
            subtitle: const Text('Contact Description'),
            leading: const Icon(Icons.person),
            trailing: IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {}),
            onTap: () {},
          );
        },
      ),
    );
  }
}
