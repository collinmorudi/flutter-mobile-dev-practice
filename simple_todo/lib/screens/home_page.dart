import 'package:flutter/material.dart';
import 'package:simple_todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _controller = TextEditingController();
  List todoList = [
    ['Buy milk', false],
    ['Buy eggs', false],
    ['Buy bread', false],
    ['Buy butter', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
    });
  }

  void saveNewTask() {
    setState(() {
      todoList.add([_controller.text, false]);
      _controller.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.shade300,
      appBar: AppBar(
        title: const Text('Simple Todo'),
        backgroundColor: Colors.deepPurple,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: todoList.length,
        itemBuilder: (BuildContext context, index) {
          return TodoList(
            taskName: todoList[index][0],
            taskCompleted: todoList[index][1],
            onChanged: (value) {
              checkBoxChanged(index);
            },
          );
        },
      ),
      floatingActionButton: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                controller: _controller,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.deepPurple.shade200,
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.white,
                    ),
                     borderRadius: BorderRadius.circular(15),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(
                      color: Colors.deepPurple,
                    ),
                     borderRadius: BorderRadius.circular(15),
                  ),
                  hintText: 'Add a new todo item',
                ),
              ),
            ),
          ),
          FloatingActionButton(
            onPressed: () {
              setState(() {
                saveNewTask();
              });
            },
            backgroundColor: Colors.deepPurple,
            foregroundColor: Colors.white,
            child: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
