// ignore_for_file: public_member_api_docs, sort_constructors_first
class OdersInformation {
  String id;
  String nameUser;
  String phoneNumber;
  String addRess;
  List<Map> itemList;
  int shippingCostn;
  int price;
  int totalAmount;
  String orderStatus;
  OdersInformation({
    required this.id,
    required this.nameUser,
    required this.phoneNumber,
    required this.addRess,
    required this.itemList,
    required this.shippingCostn,
    required this.price,
    required this.totalAmount,
    required this.orderStatus,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nameUser': nameUser,
      'phoneNumber': phoneNumber,
      'addRess': addRess,
      'item': itemList,
      'shippingCostn': shippingCostn,
      'price': price,
      'totalAmount': totalAmount,
      'orderStatus': orderStatus,
    };
  }
}

class ItemList {
  String name;
  String image;
  int price;
  String size;
  ItemList({
    required this.name,
    required this.image,
    required this.price,
    required this.size,
  });

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'price': price,
      'size': size,
    };
  }
}
