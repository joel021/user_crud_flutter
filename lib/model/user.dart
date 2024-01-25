class User {
  int? id;
  String? name;
  String username;
  String phone;
  String? email;

  User(
    this.id,
    this.name,
    this.username,
    this.phone,
    this.email,
  );

  factory User.fromJson(dynamic json) {
    return User(json['id'], json['name'], json['username'], json['phone'],
        json['email']);
  }
}
