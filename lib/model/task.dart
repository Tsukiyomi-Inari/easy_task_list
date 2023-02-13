class Task {
  String? id;
  String? taskText;
  bool isComplete;

  Task({
    required this.id,
    required this.taskText,
    this.isComplete = false,
});

  static List<Task> taskList() {
    return [
      Task(id: '01', taskText: 'Complete Mode Lab 6', isComplete: true),
      Task(id: '02', taskText: 'Record MODE lab 6 video', isComplete: false),
      Task(id: '03', taskText: 'Submit MODE lab 6', isComplete: false)
    ];
  }

}