

class Product {
  int? id;
  String? title;
  int? price;
  String? description;
  String? image;

  Product({
    this.id,
    this.title,
    this.price,
    this.description,
    this.image
  });

  factory Product.fromJson(Map<String, dynamic> json) => Product(
    id: json["id"],
    title: json["title"],
    price: json["price"],
    description: json["description"],
    image: json["image"]
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "image" :image,
  };
}