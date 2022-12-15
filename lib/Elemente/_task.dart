class Task {
  final String id;
  final String assignmentID;
  final String name;
  final String correctSolution;

  Task(this.id, this.assignmentID, this.name, this.correctSolution);
  factory Task.fromMap(Map<String, dynamic> json) {
    return Task(
        json['id'],
        json['assignmentID'],
        json['name'],
        json['correctSolution'],
    );
  }
}