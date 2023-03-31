// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileResponseModel _$UserProfileResponseModelFromJson(
        Map<String, dynamic> json) =>
    UserProfileResponseModel(
      json['fullName'] as String?,
      json['email'] as String?,
      json['transportTotalNumber'] as num?,
      json['senderTotalNumber'] as num?,
      json['gainTotalNumber'] as num?,
      json['rating'] as num?,
      json['phoneNumber'] as String?,
      json['profileImage'] as String?,
    );

Map<String, dynamic> _$UserProfileResponseModelToJson(
        UserProfileResponseModel instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullName': instance.fullName,
      'transportTotalNumber': instance.transportTotalNumber,
      'senderTotalNumber': instance.senderTotalNumber,
      'gainTotalNumber': instance.gainTotalNumber,
      'rating': instance.rating,
      'phoneNumber': instance.phoneNumber,
      'profileImage': instance.profileImage,
    };
