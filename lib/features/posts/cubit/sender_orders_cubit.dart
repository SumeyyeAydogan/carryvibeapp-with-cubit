import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/posts/model/sender_orders_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:geocode/geocode.dart';
import 'package:geolocator/geolocator.dart';

part 'sender_orders_state.dart';

class SenderOrdersCubit extends Cubit<SenderOrdersState> {
  GeoCode geoCode = GeoCode();
  SenderOrdersCubit() : super(const SenderOrdersInitial()) {
    getSenderOrders();
  }

  Future<void> getSenderOrders() async {
    try {
      emit(const SenderOrdersLoading());
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(ApiCollectionEnum.senderOrdersCollection.collectionName);
      final result = await collectionReference.get();
      emit(SenderOrdersCompleted(
        result.docs.map((e) => SenderOrdersModel.fromJson(jsonDecode(jsonEncode(e.data())))).toList(),
      ));
    } catch (e) {
      emit(SenderOrdersError(e.toString()));
    }
  }
}
