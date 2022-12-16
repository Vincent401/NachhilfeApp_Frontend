class Workload {
  final String id;
  final String assignmentID;
  final String schoolerID;
  final String toutorID;
  final String submissionID;
  final String dueDate;

  Workload(this.id, this.assignmentID, this.schoolerID, this.toutorID, this.submissionID, this.dueDate);
  factory Workload.fromMap(Map<String, dynamic> json) {
    return Workload(
      json['id'],
      json['assignmentID'],
      json['schoolerID'],
      json['toutorID'],
      json['submissionID'],
      json['dueDate']
    );
  }
}