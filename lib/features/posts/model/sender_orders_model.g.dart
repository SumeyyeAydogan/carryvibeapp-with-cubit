// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sender_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SenderOrdersModel _$SenderOrdersModelFromJson(Map<String, dynamic> json) =>
    SenderOrdersModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      isActive: json['isActive'] as bool?,
      pictures: (json['pictures'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      receiverUser: json['receiverUser'] == null
          ? null
          : ReceiverUser.fromJson(json['receiverUser'] as Map<String, dynamic>),
      sizeType: json['sizeType'] as int?,
      status: json['status'] as int?,
      deliveryLocation: json['deliveryLocation'] as String?,
      depatureLocation: json['depatureLocation'] as String?,
    );

Map<String, dynamic> _$SenderOrdersModelToJson(SenderOrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'isActive': instance.isActive,
      'pictures': instance.pictures,
      'owner': instance.owner,
      'receiverUser': instance.receiverUser,
      'sizeType': instance.sizeType,
      'status': instance.status,
      'deliveryLocation': instance.deliveryLocation,
      'depatureLocation': instance.depatureLocation,
    };

Owner _$OwnerFromJson(Map<String, dynamic> json) => Owner(
      fullName: json['fullName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$OwnerToJson(Owner instance) => <String, dynamic>{
      'fullName': instance.fullName,
      'id': instance.id,
    };

ReceiverUser _$ReceiverUserFromJson(Map<String, dynamic> json) => ReceiverUser(
      fullName: json['fullName'] as String?,
      phone: json['phone'] as String?,
    );

Map<String, dynamic> _$ReceiverUserToJson(ReceiverUser instance) =>
    <String, dynamic>{
      'fullName': instance.fullName,
      'phone': instance.phone,
    };
