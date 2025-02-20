class CartItem {
  final String id;
  final String name;
  final String image;
  final int price;
  final String size;
  final String dateTime;

  CartItem({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    required this.size,
    required this.dateTime,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'image': image,
      'price': price,
      'size': size,
      'dateTime': dateTime,
    };
  }
}
