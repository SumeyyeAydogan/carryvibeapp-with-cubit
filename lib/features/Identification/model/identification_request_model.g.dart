// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'identification_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

IdentificationRequestModel _$IdentificationRequestModelFromJson(
        Map<String, dynamic> json) =>
    IdentificationRequestModel(
      identityNumber: json['identityNumber'] as String,
      name: json['name'] as String,
      surname: json['surname'] as String,
      birthYear: json['birthYear'] as String,
    );

Map<String, dynamic> _$IdentificationRequestModelToJson(
        IdentificationRequestModel instance) =>
    <String, dynamic>{
      'identityNumber': instance.identityNumber,
      'name': instance.name,
      'surname': instance.surname,
      'birthYear': instance.birthYear,
    };
