import 'package:json_annotation/json_annotation.dart';
part 'authentication_request_model.g.dart';

@JsonSerializable()
class AuthenticationRequestModel {
  final String id;
  final String number;
  final String name;
  final String surname;
  final String birthYear;

  AuthenticationRequestModel(
      {required this.id,
      required this.number,
      required this.name,
      required this.surname,
      required this.birthYear,});

  factory AuthenticationRequestModel.fromJson(Map<String, dynamic> json) => _$AuthenticationRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AuthenticationRequestModelToJson(this);
}