import 'package:equatable/equatable.dart';

class User extends Equatable {
  final num? id;
  final String? firstName;
  final String? lastName;
  final String? email;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.email,
  });

  User copyWith({
    num? id,
    String? firstName,
    String? lastName,
    String? email,
  }) =>
      User(
        id: id ?? this.id,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        email: email ?? this.email,
      );

  static User fromJson(
    dynamic json,
  ) =>
      User(
        id: json['id'],
        firstName: json['first_name'],
        lastName: json['last_name'],
        email: json['email'],
      );

  static List<User> fromJsonList(
    dynamic json,
  ) =>
      (json == null)
          ? []
          : List<dynamic>.from(json)
              .map((dynamic userJson) => User.fromJson(userJson))
              .toList();

  dynamic toJson() => {
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
      };

  static List<dynamic> toJsonList(
    List<User> users,
  ) =>
      users.map((User user) => user.toJson()).toList();

  @override
  List<Object?> get props => [
        id,
        firstName,
        lastName,
        email,
      ];

  @override
  String toString() =>
      'User{id: $id, firstName: $firstName, lastName: $lastName, ' +
      'email: $email}';
}
