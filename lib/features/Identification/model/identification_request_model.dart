import 'package:json_annotation/json_annotation.dart';
part 'identification_request_model.g.dart';

@JsonSerializable()
class IdentificationRequestModel {
  final String identityNumber;
  final String name;
  final String surname;
  final String birthYear;

  IdentificationRequestModel(
      {required this.identityNumber,
      required this.name,
      required this.surname,
      required this.birthYear,});

  factory IdentificationRequestModel.fromJson(Map<String, dynamic> json) => _$IdentificationRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$IdentificationRequestModelToJson(this);
}