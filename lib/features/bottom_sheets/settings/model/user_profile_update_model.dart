import 'package:json_annotation/json_annotation.dart';
part 'user_profile_update_model.g.dart';

@JsonSerializable()
class UserProfileUpdateModel {
  final String? email;
  final String? fullName;
  final String? phoneNumber;
  final String? profileImage;
  UserProfileUpdateModel(this.fullName, this.email, this.phoneNumber, this.profileImage);

  factory UserProfileUpdateModel.fromJson(Map<String, dynamic> json) {
    return _$UserProfileUpdateModelFromJson(json);
  }
}