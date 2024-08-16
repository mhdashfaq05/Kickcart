class AddProductModel {
  String category;
  String image;
  String brand;
  double price;
  bool delete;
  String id;
  // List search;

  AddProductModel({
    required this.category,
    required this.image,
    required this.brand,
    required this.id,
    required this.delete,
    required this.price,
    //  required this.search,
  });

  Map<String, dynamic> toMap() {
    return {
      "category": category, "image": image, "brand": brand,
      "id": id,"price": price,"delete": delete
      //  "search": this.search,
    };
  }

  factory AddProductModel.fromMap(Map<String, dynamic> map) {
    return AddProductModel(
      category: map["category"] ?? "",
      image: map["image"] ?? "",
      brand: map["brand"] ?? "",
      id: map["id"] ?? "",
      price: map["price"]??"",
      delete: map["delete"]??"",
      //search: map["search"] ??
      //  [],
    );
  }

  AddProductModel copyWith(
      {String? category,
      String? image,
      String? id,
        String? brand,
      double? price

      }) {
    return AddProductModel(
      category: category ?? this.category,
      image: image ?? this.image,
      id: id ?? this.id,
      brand: brand ?? this.brand,
      price: price??this.price,
      delete: delete,
      // search: search?? this.search,
    );
  }
}
