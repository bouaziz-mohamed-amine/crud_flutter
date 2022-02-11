class User {
  String? email;
  String? password;
  String? name;
  User({
    this.email,
    this.password,
    this.name,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    email: json["email"],
    password: json["password"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "password": password,
    "name": name,
  };
}
