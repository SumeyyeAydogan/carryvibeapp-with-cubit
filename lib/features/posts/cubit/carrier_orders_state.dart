part of 'carrier_orders_cubit.dart';


abstract class CarrierOrdersState extends Equatable {
  const CarrierOrdersState();

  @override
  List<Object> get props => [];
}

class CarrierOrdersInitial extends CarrierOrdersState {
  const CarrierOrdersInitial();
}

class CarrierOrdersLoading extends CarrierOrdersState {
  const CarrierOrdersLoading();
}

class CarrierOrdersCompleted extends CarrierOrdersState {
  final List<CarrierOrdersModel> carrierOrdersModel;
  const CarrierOrdersCompleted(this.carrierOrdersModel);
  @override
  List<Object> get props => [carrierOrdersModel];
}

class CarrierOrdersError extends CarrierOrdersState {
  final String message;
  const CarrierOrdersError(this.message);
} 