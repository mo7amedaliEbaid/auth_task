import 'dart:convert';

UserModel userModelFromJson(String str) => UserModel.fromJson(json.decode(str));

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel {
  int? id;
  String? name;
  String? email;
  String? phone;
  String? code;
  String? img;
  dynamic countryId;
  dynamic cityId;
  String? birthDate;
  String? gender;
  UserType? userType;
  int? titleId;
  int? departmentId;
  String? createdAt;
  String? updatedAt;
  String? title;
  String? department;
  String? token;

  UserModel(
      {this.id,
        this.name,
        this.email,
        this.phone,
        this.code,
        this.img,
        this.countryId,
        this.cityId,
        this.birthDate,
        this.gender,
        this.userType,
        this.titleId,
        this.departmentId,
        this.createdAt,
        this.updatedAt,
        this.title,
        this.department,
        this.token});

  UserModel.fromJson(Map<String, dynamic> json) {

    id = json['id'];
    name = json['name'];
    email = json['email'];
    phone = json['phone'];
    code = json['code'];
    img = json['img'];
    countryId = json['country_id'];
    cityId = json['city_id'];
    birthDate = json['birth_date'];
    gender = json['gender'];
    userType = json['user_type'] == "patient"
        ? UserType.patient
        : json['user_type'] == "doctor"
        ? UserType.doctor
        : json['user_type'] == "admin"
        ? UserType.admin
        : UserType.nurse;
    titleId = json['title_id'];
    departmentId = json['department_id'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    title = json['title'];
    department = json['department'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['email'] = email;
    data['phone'] = phone;
    data['code'] = code;
    data['img'] = img;
    data['country_id'] = countryId;
    data['city_id'] = cityId;
    data['birth_date'] = birthDate;
    data['gender'] = gender;
    data['user_type'] = userType == UserType.admin
        ? "admin"
        : userType == UserType.doctor
        ? "doctor"
        : userType == UserType.patient
        ? "patient"
        : "nurse";
    data['title_id'] = titleId;
    data['department_id'] = departmentId;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    data['title'] = title;
    data['department'] = department;
    data['token'] = token;
    return data;
  }



}

enum UserType { patient, admin, doctor, nurse }
