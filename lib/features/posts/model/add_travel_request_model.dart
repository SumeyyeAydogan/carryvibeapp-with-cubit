import 'package:json_annotation/json_annotation.dart';
part 'add_travel_request_model.g.dart';

@JsonSerializable()
class AddTravelRequestModel {
  final String id;
  final String date;
  final String time;
  final String startLocation;
  final String finishLocation;

  AddTravelRequestModel(
      {required this.id,
      required this.date,
      required this.time,
      required this.startLocation,
      required this.finishLocation,});

  factory AddTravelRequestModel.fromJson(Map<String, dynamic> json) => _$AddTravelRequestModelFromJson(json);
  Map<String, dynamic> toJson() => _$AddTravelRequestModelToJson(this);
}