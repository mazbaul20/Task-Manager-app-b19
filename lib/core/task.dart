class Task {
  Task({
    this.id,
    required this.title,
    required this.description,
    required this.dueDate,
    required this.priority,
    required this.createdDate,
    this.isCompleted = false,
  });
  final int? id;
  final String title;
  final String description;
  final String dueDate;
  final String priority;
  final String createdDate;
  bool isCompleted;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dueDate': dueDate,
      'priority': priority,
      'createdDate': createdDate,
      'isCompleted': isCompleted ? 1 : 0,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      dueDate: map['dueDate'],
      priority: map['priority'],
      createdDate: map['createdDate'],
      isCompleted: map['isCompleted'] == 1,
    );
  }
}
