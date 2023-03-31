// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationRequestModel _$AuthenticationRequestModelFromJson(
        Map<String, dynamic> json) =>
    AuthenticationRequestModel(
      id: json['id'] as String,
      number: json['number'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      birthYear: json['birthYear'] as String,
    );

Map<String, dynamic> _$AuthenticationRequestModelToJson(
        AuthenticationRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'number': instance.number,
      'name': instance.name,
      'surname': instance.surname,
      'birthYear': instance.birthYear,
    };
