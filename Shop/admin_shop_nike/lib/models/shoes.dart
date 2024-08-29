class Shoe {
  String id;
  String brand;
  String names;
  imageShoes imgShoes;
  String price;
  String sizeds;
  detailShoes details;
  String status;

  Shoe({
    required this.id,
    required this.brand,
    required this.names,
    required this.imgShoes,
    required this.price,
    required this.sizeds,
    required this.details,
    required this.status,
  });

  // Tạo Shoes từ Map
  factory Shoe.fromMap(String id, Map<String, dynamic> map) {
    return Shoe(
      id: id,
      brand: map['brand'] ?? 'No brand',
      names: map['names'] ?? 'No name',
      imgShoes: imageShoes.fromMap(map['imgShoes'] ?? {}),
      price: map['price'] ?? '',
      sizeds: map['sizeds'] ?? 'No sized',
      details: detailShoes.fromMap(map['details'] ?? {}),
      status: map['status'] ?? '',
    );
  }

  // Chuyển Shoes thành Map
  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'names': names,
      'imgShoes': imgShoes.toMap(),
      'price': price,
      'sizeds': sizeds,
      'details': details.toMap(),
      'status': status,
    };
  }
}

// ignore: camel_case_types
class imageShoes {
  String img1;
  String img2;
  String img3;

  imageShoes({
    required this.img1,
    required this.img2,
    required this.img3,
  });

  // Tạo imageShoes từ Map
  factory imageShoes.fromMap(Map<String, dynamic> map) {
    return imageShoes(
      img1: map['img1'] ?? '',
      img2: map['img2'] ?? '',
      img3: map['img3'] ?? '',
    );
  }

  // Chuyển imageShoes thành Map
  Map<String, dynamic> toMap() {
    return {
      'img1': img1,
      'img2': img2,
      'img3': img3,
    };
  }
}

// ignore: camel_case_types
class detailShoes {
  String uses;
  String material;
  String producer;

  detailShoes({
    required this.uses,
    required this.material,
    required this.producer,
  });

  // Tạo detailShoes từ Map
  factory detailShoes.fromMap(Map<String, dynamic> map) {
    return detailShoes(
      uses: map['uses'] ?? '',
      material: map['material'] ?? '',
      producer: map['producer'] ?? '',
    );
  }

  // Chuyển detailShoes thành Map
  Map<String, dynamic> toMap() {
    return {
      'uses': uses,
      'material': material,
      'producer': producer,
    };
  }
}
