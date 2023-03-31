// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_update_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileUpdateModel _$UserProfileUpdateModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileUpdateModel(
      json['fullName'] as String?,
      json['email'] as String?,
      json['phoneNumber'] as String?,
      json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserProfileUpdateModelToJson(
        UserProfileUpdateModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
    };
