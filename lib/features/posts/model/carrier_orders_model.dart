import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:json_annotation/json_annotation.dart';

part 'carrier_orders_model.g.dart';

@JsonSerializable()
class CarrierOrdersModel {
  String? id;
  String? title;
  bool? isActive;
  String? picture;
  Owner? owner;
  List? date;
  int? status;
  String? deliveryLocation;
  String? depatureLocation;

  CarrierOrdersModel(
      {this.id,
      this.title,
      this.isActive,
      this.picture,
      this.owner,
      this.date,
      this.status,
      this.deliveryLocation,
      this.depatureLocation});

  factory CarrierOrdersModel.fromJson(Map<String, dynamic> json) {
    return _$CarrierOrdersModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$CarrierOrdersModelToJson(this);
}

@JsonSerializable()
class Owner {
  String? fullName;
  String? id;

  Owner({this.fullName, this.id});

  factory Owner.fromJson(Map<String, dynamic> json) {
    return _$OwnerFromJson(json);
  }
  Map<String, dynamic> toJson() => _$OwnerToJson(this);

  String get ownerFullName => fullName ?? '-';
}

@JsonSerializable()
class DeliveryLocation {
  num? lat;
  num? lng;

  DeliveryLocation({this.lat, this.lng});
  factory DeliveryLocation.fromJson(Map<String, dynamic> json) {
    return _$DeliveryLocationFromJson(json);
  }
  Map<String, dynamic> toJson() => _$DeliveryLocationToJson(this);
}