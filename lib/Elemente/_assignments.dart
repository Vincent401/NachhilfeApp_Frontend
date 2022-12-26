class Assignment {
  final String id;
  final String owner;
  final String subject;
  final String name;
  final String description;
  final bool deleted;

  Assignment(this.id, this.owner, this.subject, this.name, this.description, this.deleted);
  factory Assignment.fromMap(Map<String, dynamic> json) {
    return Assignment(
      json['id'],
      json['owner'],
      json['subject'],
      json['name'],
      json['description'],
      json['deleted']
    );
  }
}