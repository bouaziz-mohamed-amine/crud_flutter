class Category {

  int? id;
  String? title;

  Category({
    this.id,
    this.title,
  });



  factory Category.fromJson(Map<String, dynamic> json) => Category(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
  };
}