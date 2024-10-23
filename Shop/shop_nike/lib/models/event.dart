// ignore_for_file: public_member_api_docs, sort_constructors_first
class Event {
  String id;
  String title;
  String titles = '';
  String date;
  String imgEvent;
  String detailEvent;
  Event({
    required this.id,
    required this.title,
    required this.date,
    required this.imgEvent,
    required this.detailEvent,
  });

  // Method fromMap Event
  factory Event.fromMap(String id, Map<String, dynamic> map) {
    return Event(
      id: id,
      title: map['title'] ?? '',
      date: map['date'] ?? '',
      imgEvent: map['imgEvent'] ?? '',
      detailEvent: map['detailEvent'] ?? '',
    );
  }
}
