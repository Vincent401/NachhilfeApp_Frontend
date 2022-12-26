class Subjects {
  final String id;
  final String name;
  final bool deleted;

  Subjects(this.id, this.name, this.deleted);
  factory Subjects.fromMap(Map<String, dynamic> json) {
    return Subjects(
      json['id'],
      json['name'],
      json['deleted']
    );
  }
}