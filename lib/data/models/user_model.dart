import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? userType;
  String? fName;
  String? email;
  String? lName;
  String? password;
  String? img;
  String? birthDate;
  int? gender;
  int? salary;
  List<dynamic>? skills;
  String? about;

  UserModel({
    this.fName,
    this.lName,
    this.password,
    this.email,
    this.img,
    this.birthDate,
    this.gender,
    this.userType,
    this.salary,
    this.skills,
    this.about,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    fName = json['fName'];
    lName = json['lName'];
    email = json['email'];
    password = json['password'];
    img = json['img'];
    skills = json['skills'];

    birthDate = json['birthDate'];
    gender = json['gender'];
    userType = json['userType'];
    salary = json['salary'];

    about = json['about'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['fName'] = fName;
    data['lName'] = lName;
    data['email'] = email;
    data['password'] = password;
    data['skills'] = skills;
    data['img'] = img;
    data['about'] = about;
    data['salary'] = salary;
    data['birthDate'] = birthDate;
    data['gender'] = gender;
    data['userType'] = userType;

    return data;
  }
}
