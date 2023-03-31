part of 'delivery_cubit.dart';

abstract class DeliveryState extends Equatable {
  const DeliveryState();

  @override
  List<Object> get props => [];
}

class DeliveryInitial extends DeliveryState {
  int uploadPhoto;
  DeliveryInitial(this.uploadPhoto);
}

class DeliveryLoading extends DeliveryState {}

class DeliveryComplate extends DeliveryState {}
