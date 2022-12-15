class Member {
  final String id;
  final String name;
  final bool needsHelp;
  final bool offersHelp;

  Member(this.id, this.name, this.needsHelp, this.offersHelp);
  factory Member.fromMap(Map<String, dynamic> json) {
    return Member(
        json['id'],
        json['name'],
        json['needsHelp'],
        json['offersHelp']
    );
  }
}