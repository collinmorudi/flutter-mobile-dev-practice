import 'package:flutter/material.dart';
import 'package:simple_todo/utils/todo_list.dart';

class HomePage extends StatefulWidget {
  HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List todoList = [
    ['Buy milk', false],
    ['Buy eggs', false],
    ['Buy bread', false],
    ['Buy butter', false],
    ['Buy cheese', false],
    ['Buy jam', false],
    ['Buy sugar', false],
    ['Buy salt', false],
    ['Buy pepper', false],
    ['Buy coffee', false],
    ['Buy tea', false],
    ['Buy biscuits', false],
  ];

  void checkBoxChanged(int index) {
    setState(() {
      todoList[index][1] = !todoList[index][1];
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
        ));
  }
}
