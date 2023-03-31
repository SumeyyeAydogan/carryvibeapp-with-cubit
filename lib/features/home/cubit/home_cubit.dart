import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/home/model/home_page_ads_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial()) {
    getAdsImages();
  }

  Future<void> getAdsImages() async {
    try {
      emit(const HomeLoading());
      final CollectionReference collectionReference =
          FirebaseFirestore.instance.collection(ApiCollectionEnum.adsImagesCollection.collectionName);
      final result = await collectionReference.get();
      emit(HomeCompleted(
        result.docs
            .map((e) => HomeAdsImagesResponseModel.fromJson(jsonDecode(jsonEncode(e.data()))))
            .toList(),
      ));
    } catch (e) {
      emit(HomeError(e.toString()));
    }
  }
}
