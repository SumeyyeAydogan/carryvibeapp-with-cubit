// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductRequestModel _$AddProductRequestModelFromJson(
        Map<String, dynamic> json) =>
    AddProductRequestModel(
      id: json['id'] as String,
      detail: json['detail'] as String,
      product: json['product'] as String,
      startLocation: json['startLocation'] as String,
      finishLocation: json['finishLocation'] as String,
      size: (json['size'] as num).toDouble(),
    );

Map<String, dynamic> _$AddProductRequestModelToJson(
        AddProductRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'detail': instance.detail,
      'product': instance.product,
      'startLocation': instance.startLocation,
      'finishLocation': instance.finishLocation,
      'size': instance.size,
    };
