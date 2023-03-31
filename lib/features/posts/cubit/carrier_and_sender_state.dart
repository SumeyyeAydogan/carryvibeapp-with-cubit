part of 'carrier_and_sender_cubit.dart';

abstract class CarrierAndSenderState extends Equatable {
  const CarrierAndSenderState();

  @override
  List<Object> get props => [];

}

class CarrierAndSenderInitial extends CarrierAndSenderState {
  final TabController? tabController;
  const CarrierAndSenderInitial(this.tabController);
}

class CarrierAndSenderLoading extends CarrierAndSenderState {}
