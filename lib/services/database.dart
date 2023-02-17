import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_task_list/model/task.dart';

class DatabaseService {

  final String? uid;
  DatabaseService({this.uid});
  final CollectionReference taskCollection = FirebaseFirestore.instance.collection('tasks');


  Future updateUserData(Task newList) async{
     return await taskCollection.doc(uid).set({
        'id': newList.id,
        'task': newList.taskText,
        'iscomplete': newList.isComplete
     });
  }
}