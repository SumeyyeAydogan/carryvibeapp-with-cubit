import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/posts/model/carrier_orders_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

part 'carrier_orders_state.dart';

class CarrierOrdersCubit extends Cubit<CarrierOrdersState> {
  GeoCode geoCode = GeoCode();
  CarrierOrdersCubit() : super(const CarrierOrdersInitial()) {
    getCarrierOrders();
  }

  Future<void> getCarrierOrders() async {
    try {
      emit(const CarrierOrdersLoading());
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(ApiCollectionEnum.carrierOrdersCollection.collectionName);
      final result = await collectionReference.get();
      emit(CarrierOrdersCompleted(
        result.docs.map((e) => CarrierOrdersModel.fromJson(jsonDecode(jsonEncode(e.data())))).toList(),
      ));
    } catch (e) {
      emit(CarrierOrdersError(e.toString()));
    }
  }
}