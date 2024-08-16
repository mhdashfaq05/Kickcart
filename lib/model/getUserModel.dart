class AddUserModel {
  String email;
  String name;
  String password;
  String id;

  AddUserModel({
    required this.email,
    required this.name,
    required this.password,
    required this.id,
  });
  factory AddUserModel.fromJson(Map<String, dynamic> json) => AddUserModel(
    email: json["email"],
    name: json["name"],
    password: json["password"],
    id: json["id"],
  );

  Map<String, dynamic> toJson() => {
    "email": email,
    "name": name,
    "password": password,
    "id": id,
  };
  AddUserModel copyWith({
    String? name,
    String? email,
    String? password,
    String? id,
  }) {
    return AddUserModel(
      name: name ?? this.name,
      email: email ?? this.email,
      password: password ?? this.password,
      id: id?? this.id,
    );
  }
}
