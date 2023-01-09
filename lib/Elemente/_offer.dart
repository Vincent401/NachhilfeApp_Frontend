class Offer {
  final String id;
  final String subjectID;
  final String memberID;
  final bool deleted;

  Offer(this.id, this.subjectID, this.memberID, this.deleted);
  factory Offer.fromMap(Map<String, dynamic> json) {
    return Offer(
        json['id'],
        json['subjectID'],
        json['memberID'],
        json['deleted']
    );
  }
}