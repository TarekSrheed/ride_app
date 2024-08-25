import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class GetBicycleCategoryModel extends ResultModel {
  List<dynamic>? body;
  GetBicycleCategoryModel({
    this.body,
  });

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'body': body,
    };
  }

  factory GetBicycleCategoryModel.fromMap(Map<dynamic, dynamic> map) {
    return GetBicycleCategoryModel(
      body: map['body'] != null
          ? List<dynamic>.from((map['body'] as List<dynamic>))
          : null,
    );
  }

  dynamic toJson() => json.encode(toMap());

  factory GetBicycleCategoryModel.fromJson(dynamic source) =>
      GetBicycleCategoryModel.fromMap(
          json.decode(source) as Map<dynamic, dynamic>);
}
