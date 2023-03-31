// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterRequestModel _$RegisterRequestModelFromJson(
        Map<String, dynamic> json) =>
    RegisterRequestModel(
      id: json['id'] as String,
      email: json['email'] as String,
      password: json['password'] as String,
      fullName: json['fullName'] as String,
      gainTotalNumber: json['gainTotalNumber'] as num,
      identityBirthDay: json['identityBirthDay'] as String,
      identityFirstName: json['identityFirstName'] as String,
      identityLastName: json['identityLastName'] as String,
      identityNumber: json['identityNumber'] as String,
      isIdentity: json['isIdentity'] as String,
      phone: json['phone'] as String,
      phoneAuth: json['phoneAuth'] as bool,
      profileImage: json['profileImage'] as String,
      senderTotalNumber: json['senderTotalNumber'] as num,
      transportTotalNumber: json['transportTotalNumber'] as num,
    );

Map<String, dynamic> _$RegisterRequestModelToJson(
        RegisterRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'email': instance.email,
      'password': instance.password,
      'fullName': instance.fullName,
      'gainTotalNumber': instance.gainTotalNumber,
      'identityBirthDay': instance.identityBirthDay,
      'identityFirstName': instance.identityFirstName,
      'identityLastName': instance.identityLastName,
      'identityNumber': instance.identityNumber,
      'isIdentity': instance.isIdentity,
      'phone': instance.phone,
      'phoneAuth': instance.phoneAuth,
      'profileImage': instance.profileImage,
      'senderTotalNumber': instance.senderTotalNumber,
      'transportTotalNumber': instance.transportTotalNumber,
    };
