import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stridex_store/models/oders_information.dart';
import 'package:stridex_store/models/profile.dart';

import '../../models/event.dart';
import '../../models/shoes.dart';
import '../../models/sport_event.dart';

class CloudFirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  //GET SPORT EVENT FROM CLOUD FIRESTORE
  Future<List<SportEvent>> suportEventData() async {
    QuerySnapshot querySnapshotlistSport =
        await _firestore.collection('sportEvent').get();
    List<SportEvent> listSport = querySnapshotlistSport.docs.map((doc) {
      return SportEvent.fromMap(doc.id, doc.data() as Map<String, dynamic>);
    }).toList();
    return listSport;
  }

  //GET EVENT FROM CLOUD FIRESTORE
  Future<List<Event>> eventData() async {
    QuerySnapshot querySnapshotEvent =
        await _firestore.collection('event').get();
    List<Event> listEvent = querySnapshotEvent.docs.map((doc) {
      return Event.fromMap(doc.id, doc.data() as Map<String, dynamic>);
    }).toList();
    return listEvent;
  }

  //SEARCH SHOES FROM CLOUD FIRESTORE
  Future<List<Shoe>> searchByName(String searchItem) async {
    try {
      QuerySnapshot snapshot = await _firestore
          .collection('shoes')
          .where('names', isGreaterThanOrEqualTo: searchItem)
          .where('names', isLessThanOrEqualTo: '$searchItem\uf8ff')
          .get();
      List<Shoe> dataSearch = snapshot.docs.map((doc) {
        return Shoe.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
      return dataSearch;
    } catch (e) {
      print('Error search!');
    }
    return [];
  }

  //GET DATA SHOE FROM CLOUD FIRESTORE
  Future<List<Shoe>> getShoes() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('shoes').get();
      List<Shoe> shoesList = querySnapshot.docs.map((doc) {
        return Shoe.fromMap(doc.id, doc.data() as Map<String, dynamic>);
      }).toList();
      return shoesList;
    } catch (e) {
      print("Error from to Firestore: $e");
      return [];
    }
  }

// GET ORDER FROM FIRESTORE
  Future<List<OdersInformation>> getOrders(String userId,
      {String? status}) async {
    try {
      Query<Map<String, dynamic>> query =
          _firestore.collection('user').doc(userId).collection('myOders');

      if (status != null && status.isNotEmpty) {
        query = query.where('orderStatus', isEqualTo: status);
      }

      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await query.get() as QuerySnapshot<Map<String, dynamic>>;

      List<OdersInformation> orders = querySnapshot.docs.map((doc) {
        final data = doc.data();
        return OdersInformation(
          id: doc.id,
          itemList: List<Map<String, dynamic>>.from(data['item'] ?? []),
          shippingCostn: data['shippingCostn'] ?? 20,
          price: data['price'] ?? 0,
          totalAmount: data['totalAmount'] ?? 0,
          orderStatus: data['orderStatus'] ?? 'unknown',
          nameUser: data['nameUser'] ?? 'Unknown',
          phoneNumber: data['phoneNumber'] ?? 'No phone number',
          addRess: data['addRess'] ?? 'No address',
        );
      }).toList();

      return orders;
    } catch (e) {
      print("Error fetching orders: $e");
      return [];
    }
  }

  // GET PROFILE FROM FIRESTORE
  Future<Profile?> getUser(String userId) async {
    try {
      DocumentSnapshot<Map<String, dynamic>> docSnapshot =
          await _firestore.collection('user').doc(userId).get();

      if (docSnapshot.exists && docSnapshot.data() != null) {
        Map<String, dynamic> data = docSnapshot.data()!;
        Profile profile = Profile.fromMap(userId, data);

        return profile;
      } else {
        print("No such document or document is empty!");
        return null;
      }
    } catch (error) {
      print("Error fetching user profile: $error");
      return null;
    }
  }

  //UPDATE INFO USER
  Future<void> userUpDate(Profile profile) async {
    try {
      await _firestore
          .collection('user')
          .doc(profile.id)
          .update(profile.toMap());
      print('Update user successfully!');
    } catch (e) {
      print('Fail to update!: $e');
    }
  }

  //ADD ODER FROM FIRESTORE
  Future<void> addMyOrder(OdersInformation order, String uid) async {
    try {
      await _firestore
          .collection('user')
          .doc(uid)
          .collection('myOders')
          .doc(order.id)
          .set(order.toMap());
      print('Order added successfully!');
    } catch (e) {
      print('Error adding order: $e');
    }
  }
}
