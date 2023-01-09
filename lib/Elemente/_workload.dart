class Workload {
  final String id;
  final String assignmentID;
  final String schoolerID;
  final String tutorID;
  final String submissionID;
  final String dueDate;
  final bool deleted;

  Workload(this.id, this.assignmentID, this.schoolerID, this.tutorID, this.submissionID, this.dueDate, this.deleted);
  factory Workload.fromMap(Map<String, dynamic> json) {
    return Workload(
      json['id'],
      json['assignmentID'],
      json['schoolerID'],
      json['tutorID'],
      json['submissionID'],
      json['dueDate'],
      json['deleted']
    );
  }
}