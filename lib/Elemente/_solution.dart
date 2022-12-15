class Solution {
  final String id;
  final String taskID;
  final String submissionID;
  final String solutionText;

  Solution(this.id, this.taskID, this.submissionID, this.solutionText);
  factory Solution.fromMap(Map<String, dynamic> json) {
    return Solution(
      json['id'],
      json['taskID'],
      json['submissionID'],
      json['solutionText'],
    );
  }
}