class Submission {
  final String id;
  final String submissionID;
  final bool deleted;

  Submission(this.id, this.submissionID, this.deleted);
  factory Submission.fromMap(Map<String, dynamic> json) {
    return Submission(
      json['id'],
      json['submissionID'],
      json['deleted']
    );
  }
}