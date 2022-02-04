

class Product {
  int? id;
  String? title;
  int? price;
  String? description;
  String? image;
  int? category_id;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image,
    this.category_id
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    image: json["image"],
    category_id: json["category_id"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "image" :image,
    "category_id":category_id,
  };

}