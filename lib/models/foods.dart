class Foods {
  int? id;
  String? name;
  double? price;
  double? rating;
  String? img;
  String? category;
  String? description;
  bool? special;
  int? qty;
  Foods({
    this.id,
    this.name,
    this.price,
    this.img,
    this.rating,
    this.category,
    this.description,
    this.special,
    this.qty,
  });
  factory Foods.fromJson(Map<String, dynamic> json) {
    return Foods(
      id: json['id'] ?? 0,
      name: json['name'] ?? "Not found name",
      price: (json['price'] as num).toDouble(),
      rating: (json['rating'] as num).toDouble(),
      img: json['img'] ?? "Not found",
      category: json['category'] ?? "Not found cate",
      description: json['description'] ?? "Not found desc",
      special: json['special'] ?? false,
      qty: (json['qty']as num).toInt(),
    );
  }
}
