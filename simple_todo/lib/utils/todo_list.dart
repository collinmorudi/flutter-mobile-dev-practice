import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({Key? key, required this.taskName,}) : super(key: key);

  final String taskName;

  @override
  Widget build(BuildContext context) {
    return Padding(
              padding: const EdgeInsets.only(
                  top: 20, left: 20, right: 20, bottom: 0),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: Colors.deepPurple,
                ),
                padding: const EdgeInsets.all(20),
                child: Text(
                  taskName,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            );
  }
}