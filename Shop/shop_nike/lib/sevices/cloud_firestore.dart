import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shop_nike/models/shoes.dart';

class CloudFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //GET DATA FROM CLOUD FIRESTORE
  Future<List<Shoes>> getShoes() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('shoes').get();

      List<Shoes> shoesList = querySnapshot.docs.map((doc) {
        return Shoes.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();

      return shoesList;
    } catch (e) {
      print("Lỗi khi lấy dữ liệu từ Firestore: $e");
      return [];
    }
  }
}
