// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'carrier_orders_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CarrierOrdersModel _$CarrierOrdersModelFromJson(Map<String, dynamic> json) =>
    CarrierOrdersModel(
      id: json['id'] as String?,
      title: json['title'] as String?,
      isActive: json['isActive'] as bool?,
      picture: json['picture'] as String?,
      owner: json['owner'] == null
          ? null
          : Owner.fromJson(json['owner'] as Map<String, dynamic>),
      date: json['date'] as List<dynamic>?,
      status: json['status'] as int?,
      deliveryLocation: json['deliveryLocation'] as String?,
      depatureLocation: json['depatureLocation'] as String?,
    );

Map<String, dynamic> _$CarrierOrdersModelToJson(CarrierOrdersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'isActive': instance.isActive,
      'picture': instance.picture,
      'owner': instance.owner,
      'date': instance.date,
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

DeliveryLocation _$DeliveryLocationFromJson(Map<String, dynamic> json) =>
    DeliveryLocation(
      lat: json['lat'] as num?,
      lng: json['lng'] as num?,
    );

Map<String, dynamic> _$DeliveryLocationToJson(DeliveryLocation instance) =>
    <String, dynamic>{
      'lat': instance.lat,
      'lng': instance.lng,
    };
