import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ReservatinoModel {
  num? bicycleId;
  num? fromHubId;
  num? toHubId;
  num? duration;
  String? startTime;
  String? endTime;
  String? reservationStatus;
  String? paymentMethod;
  ReservatinoModel({
    this.bicycleId,
    this.fromHubId,
    this.toHubId,
    this.duration,
    this.startTime,
    this.endTime,
    this.reservationStatus,
    this.paymentMethod,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'bicycleId': bicycleId,
      'fromHubId': fromHubId,
      'toHubId': toHubId,
      'duration': duration,
      'startTime': startTime,
      'endTime': endTime,
      'reservationStatus': reservationStatus,
      'paymentMethod': paymentMethod,
    };
  }

  factory ReservatinoModel.fromMap(Map<String, dynamic> map) {
    return ReservatinoModel(
      bicycleId: map['bicycleId'] != null ? map['bicycleId'] as num : null,
      fromHubId: map['fromHubId'] != null ? map['fromHubId'] as num : null,
      toHubId: map['toHubId'] != null ? map['toHubId'] as num : null,
      duration: map['duration'] != null ? map['duration'] as num : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
      reservationStatus: map['reservationStatus'] != null
          ? map['reservationStatus'] as String
          : null,
      paymentMethod:
          map['paymentMethod'] != null ? map['paymentMethod'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ReservatinoModel.fromJson(String source) =>
      ReservatinoModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
