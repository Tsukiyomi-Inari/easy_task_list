/// @authors  Katherine Bellman
/// @date    February 14th 2023
/// @description Database service to interact with Firestore service - methods etc
///

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_task_list/model/task.dart';

class DatabaseService {

  final String? uid;  // aka users Firebase Auth uid
  DatabaseService(Set<String> set, {this.uid});

  final CollectionReference taskListCollection = FirebaseFirestore.instance.collection('task_lists');


  //creates initial list docs under userID collection after registration
  Future updateUserData(Task newList) async{
    return await taskListCollection.doc('task').collection(uid!)
        .doc('task_${DateTime.now().toUtc()}').set(newList.toJson());
  }

  //task list from snapshot
  List<Task> _taskListFromSnapshot(QuerySnapshot snapshot){
    try{
    return snapshot.docs.map((doc){
      return Task(
        id: doc.get('id')??  DateTime.now().toLocal() ,
        taskText: doc.get('taskText')?? "" ,
        isComplete: doc.get('isComplete')?? bool );
    }).toList();
    }catch(error){
      throw ArgumentError.notNull(error.toString());
    }
  }


  Stream<List<Task>> get tasks {
    return taskListCollection.doc('task').collection(uid!).snapshots()
          .map(_taskListFromSnapshot);
  }



}