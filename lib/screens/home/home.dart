import 'package:easy_task_list/services/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:easy_task_list/shared/colors.dart';
import '../../model/task.dart';
import 'package:easy_task_list/services/database.dart';
import 'package:provider/provider.dart';

import '../../widgets/task_list.dart';

class Home extends StatefulWidget {
  const Home({key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();

}

class _HomeState extends State<Home> {
  final _taskController = TextEditingController();
  final taskList = Task.taskList();
  List<Task> _foundTask = <Task>[];
  final AuthService _auth = AuthService();
  bool loading = false;


  @override
  void initState() {
 //   _foundTask = taskList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        backgroundColor: transparentMint,
        appBar: _buildAppBar(),
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal:20, vertical: 15 ),
              child: Column(
                children: [
                  searchBox(),
                  Expanded(child: ListView(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(top: 30, bottom: 20,),
                        child: const Text(
                          'All Tasks',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.w400
                          ),
                        ),
                      ),
               const TaskList(),
                ],
              ))

            ],
          ),
        ),
             Align(
              alignment: Alignment.bottomCenter,
              child: Row(
                children: [
                  Expanded(child: Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                      left: 20,
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 5,),
                    decoration:   BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [ BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0.0, 0.0),
                        blurRadius: 10.0,
                        spreadRadius: 0.0,
                      ),],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child:  TextField(
                      controller: _taskController ,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task item',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(
                      bottom: 20,
                      right: 20,
                    ),
                    child: ElevatedButton(
                      onPressed: () { 
                        _addTaskItem(_taskController.text);
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: todoMint,
                        minimumSize: const Size(60, 60),
                        elevation: 10
                      ),
                      child: const Text('+', style: TextStyle(fontSize: 40),),
                    ),
                  )
                ],
              ),
            )
        ],
      ),
    );
  }

  void _addTaskItem(String task) {
    setState(() {
      taskList.add(Task(id: DateTime.now().millisecondsSinceEpoch.toString(), taskText: task));
    });
    _taskController.clear();
  }

/*  void _handleTaskChange(Task task) {
    setState(() {
      task.isComplete = !task.isComplete;
    });
  }*/

/*  void _deleteTaskItem(String id) {
    setState(() {
      taskList.removeWhere((item) => item.id == id);
    });
  }*/

  void _filterTasks(String searchText) {

    List<Task> results = [];
    if (searchText.isEmpty) {
      results = _foundTask;
    }
    else{
         results = taskList..where((item) => item.taskText!.toLowerCase().contains(searchText.toLowerCase())).toList();
    }

    setState(() {
      _foundTask = results;
    });
  }



  //App Bar
  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: todoMint,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: const [
          Text('Easy Task List',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),),
        ],
      ),
      actions: <Widget>[
        IconButton(
            onPressed: () async{
              setState( ()=> loading = true);
              await _auth.signOut();
            },
            icon: const Icon(Icons.logout),
        )],
    );
  }




  Widget searchBox() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 10,  ),
      alignment: Alignment.centerLeft,
      decoration:  BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(20)),
      child:  TextField(
          onChanged: (value) => _filterTasks(value),
          textAlignVertical: TextAlignVertical.top,
          decoration: const InputDecoration(
              contentPadding: EdgeInsets.zero,
              prefixIcon: Icon(
                Icons.search,
                color: todoMint,
                size: 25,
              ),
              prefixIconConstraints: BoxConstraints(
                  maxHeight: 35, minWidth: 30
              ),
              border: InputBorder.none,
              hintText: 'Search',
              hintStyle: TextStyle(
                color: greySearch,
                fontSize: 20,

              )
          )
      ),
    );
  }

}



