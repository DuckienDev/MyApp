// ignore_for_file: public_member_api_docs, sort_constructors_first
class Profile {
  String id;
  String name;
  String dateOfBirth;
  String phoneNumber;
  String email;
  String addRess;
  Profile({
    required this.id,
    required this.name,
    required this.dateOfBirth,
    required this.phoneNumber,
    required this.email,
    required this.addRess,
  });
  factory Profile.fromMap(String id, Map<String, dynamic> map) {
    return Profile(
      id: id,
      name: map['names'] ?? 'No Name',
      dateOfBirth: map['dateOfBirth'] ?? 'No Date Of Birth',
      phoneNumber: map['phoneNumber'] ?? 'No Phone Number',
      email: map['email'] ?? 'No email',
      addRess: map['addRess'] ?? 'No Add Ress',
    );
  }
  Map<String, dynamic> toMap() {
    return {
      'names': name,
      'dateOfBirth': dateOfBirth,
      'phoneNumber': phoneNumber,
      'email': email,
      'addRess': addRess,
    };
  }
}
