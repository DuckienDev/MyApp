import 'package:admin_shop_nike/models/shoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  //ADD FIRESTORE
  Future<void> addShoe(Shoe shoes) async {
    try {
      await firebaseFirestore.collection('shoes').add(shoes.toMap());
      print('Add  succsessfully!');
    } catch (e) {
      print('Fail to add: $e');
      return;
    }
  }

  //DELETE FIRESTORE
  Future<void> deleteShoe(String id) async {
    try {
      await firebaseFirestore.collection('shoes').doc(id).delete();
      print('Delete successfully!');
    } catch (e) {
      print('Fail to delete: $e');
    }
  }

  //UPDATE FIRESTORE
  Future<void> upDateShoe(String id, Shoe shoe) async {
    try {
      await firebaseFirestore.collection('shoes').doc(id).update(shoe.toMap());
      print('Update successfully!');
    } catch (e) {
      print('Fail to update!: $e');
    }
  }

  //READ FIRESTORE
  Future<List<Shoe>> readShoe() async {
    try {
      QuerySnapshot querySnapshot =
          await firebaseFirestore.collection('shoes').get();
      print('Update successfully!');
      return querySnapshot.docs
          .map(
              (doc) => Shoe.fromMap(doc.id, doc.data() as Map<String, dynamic>))
          .toList();
    } catch (e) {
      print('Fail to read: $e');
      return [];
    }
  }
}
