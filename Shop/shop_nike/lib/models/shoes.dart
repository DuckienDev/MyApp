class Shoes {
  String id;
  String brand;
  String names;
  imageShoes imgShoes;
  String price;
  sizedShoe sizeds;
  detailShoes details;

  Shoes({
    required this.id,
    required this.brand,
    required this.names,
    required this.imgShoes,
    required this.price,
    required this.sizeds,
    required this.details,
  });

  // Tạo Shoes từ Map
  factory Shoes.fromMap(String id, Map<String, dynamic> map) {
    return Shoes(
      id: id,
      brand: map['brand'] ?? 'No brand',
      names: map['names'] ?? 'No name',
      imgShoes: imageShoes.fromMap(map['imgShoes'] ?? {}),
      price: map['price'] ?? '',
      sizeds: sizedShoe.fromMap(map['sizeds'] ?? {}),
      details: detailShoes.fromMap(map['details'] ?? {}),
    );
  }

  // Chuyển Shoes thành Map
  Map<String, dynamic> toMap() {
    return {
      'brand': brand,
      'names': names,
      'imgShoes': imgShoes.toMap(),
      'price': price,
      'sizeds': sizeds.toMap(),
      'details': details.toMap(),
    };
  }
}

// ignore: camel_case_types
class sizedShoe {
  int sized39;
  int sized40;
  int sized41;

  sizedShoe({
    required this.sized39,
    required this.sized40,
    required this.sized41,
  });

  // Tạo sizedShoe từ Map
  factory sizedShoe.fromMap(Map<String, dynamic> map) {
    return sizedShoe(
      sized39: map['sized39'] ?? 0,
      sized40: map['sized40'] ?? 0,
      sized41: map['sized41'] ?? 0,
    );
  }

  // Chuyển sizedShoe thành Map
  Map<String, dynamic> toMap() {
    return {
      'sized39': sized39,
      'sized40': sized40,
      'sized41': sized41,
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
  int vote;

  detailShoes({
    required this.uses,
    required this.material,
    required this.producer,
    required this.vote,
  });

  // Tạo detailShoes từ Map
  factory detailShoes.fromMap(Map<String, dynamic> map) {
    return detailShoes(
      uses: map['uses'] ?? '',
      material: map['material'] ?? '',
      producer: map['producer'] ?? '',
      vote: map['vote'] ?? 0,
    );
  }

  // Chuyển detailShoes thành Map
  Map<String, dynamic> toMap() {
    return {
      'uses': uses,
      'material': material,
      'producer': producer,
      'vote': vote,
    };
  }
}
