import 'package:json_annotation/json_annotation.dart';
part 'user_profile_response_model.g.dart';

@JsonSerializable()
class UserProfileResponseModel {
  final String? email;
  final String? fullName;
  final num? transportTotalNumber;
  final num? senderTotalNumber;
  final num? gainTotalNumber;
  final num? rating;
  final String? phoneNumber;
  final String? profileImage;
  UserProfileResponseModel(this.fullName, this.email, this.transportTotalNumber, this.senderTotalNumber,
      this.gainTotalNumber, this.rating, this.phoneNumber, this.profileImage);

  factory UserProfileResponseModel.fromJson(Map<String, dynamic> json) {
    return _$UserProfileResponseModelFromJson(json);
  }
}
