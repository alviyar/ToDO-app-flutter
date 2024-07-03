import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/model/todo.dart';

class TodoItem extends StatelessWidget {
  final ToDo todo;
  final onToDoChanged;
  final onDeleteItem;

  const TodoItem({
    Key? key,
  required this.todo,
  required this.onToDoChanged,
  required this.onDeleteItem,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onToDoChanged(todo);
        },
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        tileColor: Theme.of(context).colorScheme.surface,
        leading: Icon(
          todo.isDone ? Icons.check_box : Icons.check_box_outline_blank,
          color: Theme.of(context).colorScheme.primary,
        ),
        title: Text(
          todo.todoText,
          style: GoogleFonts.poppins(
            fontSize: 16,
            color: Theme.of(context).colorScheme.onSecondary,
            decoration: todo.isDone ? TextDecoration.lineThrough : null,
            decorationColor: Theme.of(context).colorScheme.onSecondary,
          ),
        ),
        trailing: Container(
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: Color.fromARGB(255, 246, 115, 106),
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Theme.of(context).colorScheme.onError,
            iconSize: 20,
            icon: Center(child: Icon(Icons.delete)),
            onPressed: () {
              onDeleteItem(todo.id);
            },
          ),
        ),
      ),
    );
  }
}