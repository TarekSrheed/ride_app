import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GetBicycleCategoryModel extends ResultModel {
  List<String>? body;
  GetBicycleCategoryModel({
    this.body,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'body': body,
    };
  }

  factory GetBicycleCategoryModel.fromMap(Map<String, dynamic> map) {
    return GetBicycleCategoryModel(
      body: map['body'] != null ? List<String>.from((map['body'] as List<String>)) : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetBicycleCategoryModel.fromJson(String source) => GetBicycleCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
