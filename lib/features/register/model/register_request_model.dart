import 'package:json_annotation/json_annotation.dart';
part 'register_request_model.g.dart';

@JsonSerializable()
class RegisterRequestModel {
  final String id;
  final String email;
  final String password;
  final String fullName;
  final num gainTotalNumber;
  final String identityBirthDay;
  final String identityFirstName;
  final String identityLastName;
  final String identityNumber;
  late final String isIdentity;
  final String phone;
  final bool phoneAuth;
  final String profileImage;
  final num senderTotalNumber;
  final num transportTotalNumber;

  

  RegisterRequestModel(
      {required this.id,
      required this.email,
      required this.password,
      required this.fullName,
      required this.gainTotalNumber,
      required this.identityBirthDay,
      required this.identityFirstName,
      required this.identityLastName,
      required this.identityNumber,
      required this.isIdentity,
      required this.phone,
      required this.phoneAuth,
      required this.profileImage,
      required this.senderTotalNumber,
      required this.transportTotalNumber});

  factory RegisterRequestModel.fromJson(Map<String, dynamic> json) => _$RegisterRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterRequestModelToJson(this);
}
