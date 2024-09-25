import 'package:admin_shop_nike/models/orders_information.dart';
import 'package:admin_shop_nike/models/shoes.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class CloudFirestore {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

  // GET ORDER FROM FIRESTORE
  Future<List<OdersInformation>> getAllOrders() async {
    List<OdersInformation> allOrders = [];
    try {
      QuerySnapshot<Map<String, dynamic>> ordersSnapshot =
          await firebaseFirestore.collectionGroup('myOders').get();

      for (var orderDoc in ordersSnapshot.docs) {
        final data = orderDoc.data();
        OdersInformation order = OdersInformation(
          id: orderDoc.id,
          itemList: List<Map<String, dynamic>>.from(data['item'] ?? []),
          shippingCostn: data['shippingCostn'] ?? 20,
          price: data['price'] ?? 0,
          totalAmount: data['totalAmount'] ?? 0,
          orderStatus: data['orderStatus'] ?? 'unknown',
          nameUser: data['nameUser'] ?? 'Unknown',
          phoneNumber: data['phoneNumber'] ?? 'No phone number',
          addRess: data['addRess'] ?? 'No address',
        );
        allOrders.add(order);
      }

      return allOrders;
    } catch (e) {
      print("Error fetching all orders: $e");
      return [];
    }
  }

  //UPDATE STATE ORDER FS
  Future<void> updateStateOrder(String id, String state) async {
    try {
      QuerySnapshot querySnapshot = await firebaseFirestore
          .collectionGroup('myOders')
          .where('id', isEqualTo: id)
          .get();

      if (querySnapshot.docs.isNotEmpty) {
        for (var doc in querySnapshot.docs) {
          await doc.reference.update({'orderStatus': state});
        }
        print('Order status updated successfully!');
      } else {
        print('No order found with id: $id');
      }
    } catch (e) {
      print('Error updating order status: $e');
    }
  }

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
