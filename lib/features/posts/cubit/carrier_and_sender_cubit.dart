import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'carrier_and_sender_state.dart';

class CarrierAndSenderCubit extends Cubit<CarrierAndSenderState> {
  TabController? tabController;
  CarrierAndSenderCubit(this.tabController)
      : super(CarrierAndSenderInitial(tabController));
  void changeIndex({required int index}) {
    emit(CarrierAndSenderLoading());
    tabController?.index = index;
    print(tabController?.index);
    emit(CarrierAndSenderInitial(tabController));
  }
}
