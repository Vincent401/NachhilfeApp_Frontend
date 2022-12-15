class Subjects {
  final String id;
  final String name;

  Subjects(this.id, this.name);
  factory Subjects.fromMap(Map<String, dynamic> json) {
    return Subjects(
      json['id'],
      json['name']
    );
  }
}