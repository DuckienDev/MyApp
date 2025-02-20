class SportEvent {
  String id;
  String sport;
  String image;
  SportEvent({
    required this.id,
    required this.sport,
    required this.image,
  });

  SportEvent copyWith({
    String? id,
    String? sport,
    String? image,
  }) {
    return SportEvent(
      id: id ?? this.id,
      sport: sport ?? this.sport,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'sport': sport,
      'image': image,
    };
  }

  factory SportEvent.fromMap(String id, Map<String, dynamic> map) {
    return SportEvent(
       id: id,
      sport: map['sport'] as String,
      image: map['image'] as String,
    );
  }

}
