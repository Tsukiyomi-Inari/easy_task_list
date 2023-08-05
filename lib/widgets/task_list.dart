import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_task_list/widgets/task_tile.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

import '../model/task.dart';
import '../services/database.dart';
import '../shared/loading.dart';

class TaskList extends StatefulWidget {
  const TaskList({super.key});

  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList>{
  @override
  Widget build(BuildContext context){
    final tasks = Provider.of<List<Task>>(context);
    final foundTasks = Task.taskList();

    return  ListView.builder(
        itemCount: tasks.length,
        itemBuilder: (context, index){
      return TaskTile(task: tasks[index]
      );},);

     /* return StreamProvider<List<Task>>.value(
        value:  DatabaseService(FirebaseAuth.instance.currentUser?uid).tasks ,
        initialData: foundTasks,
        child: tasks.length.toString() == '' ?
        const Center(
          child: Loading(),) :
        ListView.builder(
            itemCount: tasks.length,
            itemBuilder: (context, index){
              return TaskTile(task: tasks[index]
      );},
      ),
      );*/
    }
  }




