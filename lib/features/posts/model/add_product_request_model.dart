import 'package:json_annotation/json_annotation.dart';
part 'add_product_request_model.g.dart';

@JsonSerializable()
class AddProductRequestModel {
  final String id;
  final String detail;
  final String product;
  final String startLocation;
  final String finishLocation;
  final double size;

  AddProductRequestModel(
      {required this.id,
      required this.detail,
      required this.product,
      required this.startLocation,
      required this.finishLocation,
      required this.size,});

  factory AddProductRequestModel.fromJson(Map<String, dynamic> json) => _$AddProductRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddProductRequestModelToJson(this);
}