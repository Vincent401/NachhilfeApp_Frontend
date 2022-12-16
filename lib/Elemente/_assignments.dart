class Assignment {
  final String id;
  final String owner;
  final String subjectID;
  final String name;
  final String description;

  Assignment(this.id, this.owner, this.subjectID, this.name, this.description);
  factory Assignment.fromMap(Map<String, dynamic> json) {
    return Assignment(
      json['id'],
      json['owner'],
      json['subjectID'],
      json['name'],
      json['description']
    );
  }
}