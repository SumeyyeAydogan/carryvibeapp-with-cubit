// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_travel_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddTravelRequestModel _$AddTravelRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddTravelRequestModel(
      id: json['id'] as String,
      date: json['date'] as String,
      time: json['time'] as String,
      startLocation: json['startLocation'] as String,
      finishLocation: json['finishLocation'] as String,
    );

Map<String, dynamic> _$AddTravelRequestModelToJson(
        AddTravelRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'date': instance.date,
      'time': instance.time,
      'startLocation': instance.startLocation,
      'finishLocation': instance.finishLocation,
    };
