// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

class AddMoneyToWalletModel extends ResultModel {
  String message;
  Body body;
  AddMoneyToWalletModel({
    required this.message,
    required this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'message': message,
      'body': body.toMap(),
    };
  }

  factory AddMoneyToWalletModel.fromMap(Map<String, dynamic> map) {
    return AddMoneyToWalletModel(
      message: map['message'] as String,
      body: Body.fromMap(map['body'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddMoneyToWalletModel.fromJson(String source) =>
      AddMoneyToWalletModel.fromMap(
          json.decode(source) as Map<String, dynamic>);
}

class Body {
  num balance;
  Body({
    required this.balance,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'balance': balance,
    };
  }

  factory Body.fromMap(Map<String, dynamic> map) {
    return Body(
      balance: map['balance'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory Body.fromJson(String source) =>
      Body.fromMap(json.decode(source) as Map<String, dynamic>);
}
