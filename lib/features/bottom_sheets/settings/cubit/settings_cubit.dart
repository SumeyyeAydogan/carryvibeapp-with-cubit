import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/profile/model/user_profile_response_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'settings_state.dart';

class SettingsCubit extends Cubit<SettingsState> {
  SettingsCubit() : super(SettingsInitial()) {
    updateUserProfile();
  }

  Future<void> updateUserProfile() async {
    final FirebaseAuth user = FirebaseAuth.instance;
    try {
      emit(const SettingsLoading());
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(ApiCollectionEnum.userCollection.collectionName)
          .doc(user.currentUser?.uid)
          .get();
      emit(SettingsCompleted(
          UserProfileResponseModel.fromJson(documentSnapshot.data() as Map<String, dynamic>)));
    } catch (e) {
      emit(SettingsError(e.toString()));
    }
  }
}