class User {
  int userId;
  String username;
  String phone;

  User(this.userId, this.phone, this.username);

  factory User.fromJson(dynamic json) {
    return User(json['userId'], json['username'], json['phone']);
  }

}