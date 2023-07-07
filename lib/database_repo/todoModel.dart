class TodoModel {
  final int? id;
  final String taskName;
  final String taskDate;
  final String startTime;
  final String endTime;
  final String description;

  TodoModel(
      {this.id,
      required this.taskName,
      required this.taskDate,
      required this.startTime,
      required this.endTime,
      required this.description});

  factory TodoModel.fromJson(Map<String, dynamic> map) {
    return TodoModel(
      id: map['id'],
      taskName: map['taskName'],
      taskDate: map['taskDate'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      description: map['description'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'taskName': taskName,
      'taskDate': taskDate,
      'startTime': startTime,
      'endTime': endTime,
      'description': description,
    };
  }
}
