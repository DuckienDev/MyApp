// ignore_for_file: public_member_api_docs, sort_constructors_first
class Ticket {
  int id;
  String airlines;
  String logo;
  String start;
  String destination;
  String times;
  String numberOfStop;
  String tripTime;
  String price;
  Ticket({
    required this.id,
    required this.airlines,
    required this.logo,
    required this.start,
    required this.destination,
    required this.times,
    required this.numberOfStop,
    required this.tripTime,
    required this.price,
  });
}
