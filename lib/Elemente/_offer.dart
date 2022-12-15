class Offer {
  final String id;
  final String subjectID;
  final String memberID;

  Offer(this.id, this.subjectID, this.memberID);
  factory Offer.fromMap(Map<String, dynamic> json) {
    return Offer(
        json['id'],
        json['submissionID'],
        json['memberID']
    );
  }
}