import 'package:flutter/material.dart';
import 'package:shop_nike/models/cart_item.dart';
import 'package:shop_nike/models/oders_information.dart';

class Cart extends ChangeNotifier {
  final Map<String, CartItem> _items = {};
  Map<String, CartItem> get items => _items;
  int get totalAmount {
    var total = 0;
    _items.forEach((key, cartItem) {
      total += cartItem.price;
    });
    return total;
  }

  List<Map<String, dynamic>> get itemList {
    return _items.values.map((cartItem) {
      return ItemList(
        name: cartItem.name,
        image: cartItem.image,
        price: cartItem.price,
        size: cartItem.size,
      ).toMap();
    }).toList();
  }

  void addItem(
    String id,
    String name,
    String image,
    int price,
    String size,
    String dateTime,
  ) {
    final cartKey = id;

    _items.putIfAbsent(
      cartKey,
      () => CartItem(
        id: id,
        name: name,
        image: image,
        price: price,
        size: size,
        dateTime: dateTime,
      ),
    );
    notifyListeners();
  }

  void removeItem(String id) {
    final cartKey = id;
    _items.remove(cartKey);
    notifyListeners();
  }

  void clearCart() {
    _items.clear();
    notifyListeners();
  }
}
