import 'dart:convert';

class HupsModel {
  String name;
  double latitude;
  double longitude;
  String description;
  HupsModel({
    required this.name,
    required this.latitude,
    required this.longitude,
    required this.description,
  });

  HupsModel copyWith({
    String? name,
    double? latitude,
    double? longitude,
    String? description,
  }) {
    return HupsModel(
      name: name ?? this.name,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      description: description ?? this.description,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'latitude': latitude,
      'longitude': longitude,
      'description': description,
    };
  }

  factory HupsModel.fromMap(Map<String, dynamic> map) {
    return HupsModel(
      name: map['name'] as String,
      latitude: map['latitude'] as double,
      longitude: map['longitude'] as double,
      description: map['description'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory HupsModel.fromJson(String source) =>
      HupsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'HupsModel(name: $name, latitude: $latitude, longitude: $longitude, description: $description)';
  }

  @override
  bool operator ==(covariant HupsModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.description == description;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        description.hashCode;
  }
}
