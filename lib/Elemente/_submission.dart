class Submission {
  final String id;
  final String submissionID;

  Submission(this.id, this.submissionID);
  factory Submission.fromMap(Map<String, dynamic> json) {
    return Submission(
      json['id'],
      json['submissionID']
    );
  }
}