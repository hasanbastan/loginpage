// To parse this JSON data, do
//
//     final users = usersFromJson(jsonString);

import 'dart:convert';

Users usersFromJson(String str) => Users.fromJson(json.decode(str));

String usersToJson(Users data) => json.encode(data.toJson());

class Users {
  List<User> users;

  Users({
    required this.users,
  });

  factory Users.fromJson(Map<String, dynamic> json) => Users(
        users: List<User>.from(json["users"].map((x) => User.fromJson(x))),
      );

  get data => null;

  Map<String, dynamic> toJson() => {
        "users": List<dynamic>.from(users.map((x) => x.toJson())),
      };
}

class User {
  int id;
  String username;
  String userTitle;
  String password;
  dynamic deletedAt;
  dynamic createdAt;
  dynamic updatedAt;

  User({
    required this.id,
    required this.username,
    required this.userTitle,
    required this.password,
    required this.deletedAt,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        userTitle: json["userTitle"],
        password: json["password"],
        deletedAt: json["deleted_at"],
        createdAt: json["created_at"],
        updatedAt: json["updated_at"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "userTitle": userTitle,
        "password": password,
        "deleted_at": deletedAt,
        "created_at": createdAt,
        "updated_at": updatedAt,
      };
}
