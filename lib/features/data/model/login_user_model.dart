import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class LoginUserModel {
  String? password;
  String? phone;
  LoginUserModel({
    this.password,
    this.phone,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'password': password,
      'phone': phone,
    };
  }

  factory LoginUserModel.fromMap(Map<String, dynamic> map) {
    return LoginUserModel(
      password: map['password'] != null ? map['password'] as String : null,
      phone: map['phone'] != null ? map['phone'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory LoginUserModel.fromJson(String source) => LoginUserModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
