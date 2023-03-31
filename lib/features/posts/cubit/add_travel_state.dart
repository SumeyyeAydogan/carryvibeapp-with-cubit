import 'package:carryvibeapp/features/posts/model/carrier_orders_model.dart';
import 'package:carryvibeapp/features/profile/model/user_profile_response_model.dart';
import 'package:equatable/equatable.dart';

abstract class AddTravelState extends Equatable {
  const AddTravelState();

  @override
  List<Object> get props => [];

  /* get carrierModel => null;

  get profileModel => null;
 */
  /* get carrierModel => null;
   List<Object> get props1 => [];
  List<Object> get props2 => []; */
}

class AddTravelInitial extends AddTravelState {}

class AddTravelLoading extends AddTravelState {
  const AddTravelLoading();
}

class AddTravelCompleted extends AddTravelState {
  final String message;
  /* final UserProfileResponseModel profileModel;
  final List<CarrierOrdersModel> carrierModel; */
  const AddTravelCompleted(/* this.carrierModel, */ this.message, /* this.profileModel */);
  @override
  List<Object> get props => [/* carrierModel, profileModel, */ message];
  /* List<Object> get props1 => [profileModel];
  List<Object> get props2 => [message]; */
}

class AddTravelError extends AddTravelState {
  final String message;
  const AddTravelError(this.message);
  @override
  List<Object> get props => [message];
}
