import 'package:json_annotation/json_annotation.dart';
//import 'package:json_serializable/json_serializable.dart';

@JsonSerializable(explicitToJson: true)
class Task {
  final String? id;
  final String? taskText;
  final bool isComplete;

  Task({
    required this.id,
    required this.taskText,
     this.isComplete = false,
});

  Task fromJson(Map<String, dynamic>? json) {
    if(json == null){
      return Task(
        id: DateTime.now().millisecondsSinceEpoch.toString(),
        taskText: "Default Task",
        isComplete: false
      );
    }

    return Task(
        id: json["id"],
        taskText: json["taskText"],
        isComplete: json["isComplete"]
    );
  }


/*  Task.fromJson(Map<String, dynamic> json)
    : this(
    id: json['id']! as String,
    taskText: json['taskText']! as String,
    isComplete: json['isComplete']! as bool
  );*/

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'taskText': taskText,
      'isComplete': isComplete
    };
  }


 static List<Task> taskList() {
    return [
      Task(id: DateTime.now().millisecondsSinceEpoch.toString(), taskText: 'Example completed task', isComplete: true),
      Task(id: DateTime.now().millisecondsSinceEpoch.toString(), taskText: 'Example task', isComplete: false),
    ];
  }

}
//@Collection<Task>('task')
//final taskRef = TaskCollectionReference();


