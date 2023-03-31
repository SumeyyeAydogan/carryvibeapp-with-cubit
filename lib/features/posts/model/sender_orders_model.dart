import 'package:json_annotation/json_annotation.dart';

part 'sender_orders_model.g.dart';

@JsonSerializable()
class SenderOrdersModel {
  String? id;
  String? title;
  String? description;
  bool? isActive;
  List<String>? pictures;
  Owner? owner;
  ReceiverUser? receiverUser;
  int? sizeType;
  int? status;
  String? deliveryLocation;
  String? depatureLocation;

  SenderOrdersModel(
      {this.id,
      this.title,
      this.description,
      this.isActive,
      this.pictures,
      this.owner,
      this.receiverUser,
      this.sizeType,
      this.status,
      this.deliveryLocation,
      this.depatureLocation});

  factory SenderOrdersModel.fromJson(Map<String, dynamic> json) {
    return _$SenderOrdersModelFromJson(json);
  }
  Map<String, dynamic> toJson() => _$SenderOrdersModelToJson(this);
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
class ReceiverUser {
  String? fullName;
  String? phone;

  ReceiverUser({this.fullName, this.phone});
  factory ReceiverUser.fromJson(Map<String, dynamic> json) {
    return _$ReceiverUserFromJson(json);
  }
  Map<String, dynamic> toJson() => _$ReceiverUserToJson(this);
}

/* @JsonSerializable()
class DeliveryLocation {
  num? lat;
  num? lng;

  DeliveryLocation({this.lat, this.lng});
  factory DeliveryLocation.fromJson(Map<String, dynamic> json) {
    return _$DeliveryLocationFromJson(json);
  }
  Map<String, dynamic> toJson() => _$DeliveryLocationToJson(this);
} */
