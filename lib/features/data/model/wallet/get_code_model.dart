// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

class GetCodeModel extends ResultModel {
  String code;
  String localDateTime;
  String status;
  num amount; 
  GetCodeModel({
    required this.code,
    required this.localDateTime,
    required this.status,
    required this.amount,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'localDateTime': localDateTime,
      'status': status,
      'amount': amount,
    };
  }

  factory GetCodeModel.fromMap(Map<String, dynamic> map) {
    return GetCodeModel(
      code: map['code'] as String,
      localDateTime: map['localDateTime'] as String,
      status: map['status'] as String,
      amount: map['amount'] as num,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetCodeModel.fromJson(String source) => GetCodeModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
