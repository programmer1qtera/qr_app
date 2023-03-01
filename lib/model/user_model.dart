class UserModel {
  final String name;
  final String role;

  UserModel({
    required this.name,
    required this.role,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        name: json['name'],
        role: json['role'],
      );
}
