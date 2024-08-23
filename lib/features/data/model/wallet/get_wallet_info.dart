// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

class GetWalletInfoModel extends ResultModel {
  num? id;
  num? balance;
  String? bankAccount;
  GetWalletInfoModel({
    this.id,
    this.balance,
    this.bankAccount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'balance': balance,
      'bankAccount': bankAccount,
    };
  }

  factory GetWalletInfoModel.fromMap(Map<String, dynamic> map) {
    return GetWalletInfoModel(
      id: map['id'] != null ? map['id'] as num : null,
      balance: map['balance'] != null ? map['balance'] as num : null,
      bankAccount: map['bankAccount'] != null ? map['bankAccount'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetWalletInfoModel.fromJson(String source) => GetWalletInfoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
