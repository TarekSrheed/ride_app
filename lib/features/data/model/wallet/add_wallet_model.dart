



// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

class AddWalletModel extends ResultModel {
String securityCode;
String confirmSecurityCode;
String bankAccount;
  AddWalletModel({
    required this.securityCode,
    required this.confirmSecurityCode,
    required this.bankAccount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'securityCode': securityCode,
      'confirmSecurityCode': confirmSecurityCode,
      'bankAccount': bankAccount,
    };
  }

  factory AddWalletModel.fromMap(Map<String, dynamic> map) {
    return AddWalletModel(
      securityCode: map['securityCode'] as String,
      confirmSecurityCode: map['confirmSecurityCode'] as String,
      bankAccount: map['bankAccount'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AddWalletModel.fromJson(String source) => AddWalletModel.fromMap(json.decode(source) as Map<String, dynamic>);
}