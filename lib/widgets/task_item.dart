import 'package:easy_task_list/constants/colors.dart';
import 'package:flutter/material.dart';
import '../model/task.dart';

class TaskItem extends StatelessWidget {
  final Task task;
  final onTaskChanged;
  final onDeleteTask;

  const  TaskItem({Key? key, required this.task, required this.onDeleteTask, required this.onTaskChanged}) : super(key:key);

  @override
  Widget build(BuildContext context){
    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      child: ListTile(
        onTap: () {
          onTaskChanged(task);
        },
        shape: RoundedRectangleBorder(borderRadius:BorderRadius.circular(20)
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
        tileColor: Colors.white,
        leading:  Icon(
          task.isComplete? Icons.check_box : Icons.check_box_outline_blank,
          color: todoMint,
        ),
        title: Text(task.taskText! ,
          style:  TextStyle(
              fontSize: 16,
              color: todoBlack,
              decoration: task.isComplete? TextDecoration.lineThrough : null
          ),
        ),
        trailing: Container(
          padding: const EdgeInsets.all(0),
          margin: const EdgeInsets.symmetric(vertical: 12),
          height: 35,
          width: 35,
          decoration: BoxDecoration(
            color: todoRed,
            borderRadius: BorderRadius.circular(5),
          ),
          child: IconButton(
            color: Colors.white,
            iconSize: 18,
            icon: const Icon(Icons.delete),
            onPressed: () {
              onDeleteTask(task.id);
            },
          ),
        ),
      ),
    );
  }
}