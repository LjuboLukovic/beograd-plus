// ignore_for_file: type_init_formals

import 'package:toto_app/src/model/country.dart';
import 'package:toto_app/src/model/gender.dart';
import 'package:toto_app/src/model/team.dart';
import 'package:intl/intl.dart';

class User {
  String username = '';
  int? id;
  String? email;
  String? firstName;
  String? lastName;
  DateTime? dateOfBirth;
  String? gender;
  bool? verified;
  bool? disabled;
  Team? nationalTeam;
  Country? country;
  dynamic? avatar;

  User(String this.username,
      {int? this.id,
      String? this.firstName,
      String? this.lastName,
      String? this.email,
      Team? this.nationalTeam,
      DateTime? this.dateOfBirth,
      String? this.gender});

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['username'] != null) username = json['username'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    gender = json['gender'];
    email = json['email'];
    if (json['dateOfBirth'] != null)
      dateOfBirth = DateTime.parse(json['dateOfBirth']);
    if (json['verified'] != null) verified = json['verified'];
    if (json['disabled'] != null) disabled = json['disabled'];
    if (json['nationalTeam'] != null)
      nationalTeam = Team.fromJson(json['nationalTeam']);
    if (json['country'] != null) country = Country.fromJson(json['country']);
    if (json['avatar'] != null) avatar = json['avatar'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (id != null) data['id'] = id;
    data['username'] = username;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['gender'] = gender;

    if (dateOfBirth != null)
      data['dateOfBirth'] = DateFormat('yyyy-MM-dd').format(dateOfBirth!);
    if (nationalTeam != null) data['nationalTeam'] = nationalTeam!.toJson();
    if (country != null) data['country'] = country!.toJson();
    return data;
  }

  void setAttribute(String name, dynamic value) {
    switch (name) {
      case 'firstName':
        firstName = value;
        break;
      case 'gender':
        gender = value;
        break;
      case 'avatar':
        avatar = value;
        break;
    }
  }
}
