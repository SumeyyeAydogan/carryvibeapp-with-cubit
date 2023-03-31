import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'delivery_state.dart';

class DeliveryCubit extends Cubit<DeliveryState> {
  int uploadPhoto;
  DeliveryCubit(this.uploadPhoto) : super(DeliveryInitial(uploadPhoto));
  void changeValue({required int value}) {
    emit(DeliveryLoading());
    uploadPhoto = value;
    emit(DeliveryInitial(uploadPhoto));
  }
}
