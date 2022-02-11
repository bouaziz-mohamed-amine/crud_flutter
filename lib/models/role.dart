class Role {

  int? id;
  String? role;

  Role({
    this.id,
    this.role,
  });

  factory Role.fromJson(Map<String, dynamic> json) => Role(
    id: json["id"],
    role: json["role"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "role": role,
  };
}