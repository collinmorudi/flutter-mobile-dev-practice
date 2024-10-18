import 'package:flutter/material.dart';

class TodoList extends StatelessWidget {
  const TodoList({
    Key? key,
    required this.taskName,
    required this.taskCompleted,
    this.onChanged,
  }) : super(key: key);

  final String taskName;
  final bool taskCompleted;
  final Function(bool?)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 20, right: 20, bottom: 0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.deepPurple,
        ),
        padding: const EdgeInsets.all(20),
        child: Row(
          children: [
            Checkbox(
              value: taskCompleted,
              onChanged: onChanged,
              checkColor: Colors.black,
              activeColor: Colors.white,
              side: const BorderSide(
                color: Colors.white,
              ),
            ),
            Text(
              taskName,
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                decoration: taskCompleted
                    ? TextDecoration.lineThrough
                    :TextDecoration.none,
                decorationColor: Colors.white,
                decorationThickness: 2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
