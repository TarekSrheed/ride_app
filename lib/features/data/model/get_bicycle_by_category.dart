// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:rideshare_app/features/data/model/login_model/handling_model.dart';

class GetBicycleByCategoryModel extends ResultModel {
  ModelPrice modelPrice;
  num id;
  num size;
  String photoPath;
  String type;
  String note;
  GetBicycleByCategoryModel({
    required this.modelPrice,
    required this.id,
    required this.size,
    required this.photoPath,
    required this.type,
    required this.note,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'modelPrice': modelPrice.toMap(),
      'id': id,
      'size': size,
      'photoPath': photoPath,
      'type': type,
      'note': note,
    };
  }

  factory GetBicycleByCategoryModel.fromMap(Map<String, dynamic> map) {
    return GetBicycleByCategoryModel(
      modelPrice:
          ModelPrice.fromMap(map['model_price'] as Map<String, dynamic>),
      id: map['id'] as num,
      size: map['size'] as num,
      photoPath: map['photoPath'] as String,
      type: map['type'] as String,
      note: map['note'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory GetBicycleByCategoryModel.fromJson(String source) =>
      GetBicycleByCategoryModel.fromMap(json.decode(source) as Map<String, dynamic>);
}

class ModelPrice {
  num id;
  num price;
  String model;
  ModelPrice({
    required this.id,
    required this.price,
    required this.model,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'price': price,
      'model': model,
    };
  }

  factory ModelPrice.fromMap(Map<String, dynamic> map) {
    return ModelPrice(
      id: map['id'] as num,
      price: map['price'] as num,
      model: map['model'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ModelPrice.fromJson(String source) =>
      ModelPrice.fromMap(json.decode(source) as Map<String, dynamic>);
}
