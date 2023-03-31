import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/profile/model/user_profile_response_model.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial()) {
    getUserProfile();
  }

  Future<void> getUserProfile() async {
    final FirebaseAuth user = FirebaseAuth.instance;
    try {
      emit(const ProfileLoading());
      final DocumentSnapshot documentSnapshot = await FirebaseFirestore.instance
          .collection(ApiCollectionEnum.userCollection.collectionName)
          .doc(user.currentUser?.uid)
          .get();
      emit(ProfileCompleted(
          UserProfileResponseModel.fromJson(documentSnapshot.data() as Map<String, dynamic>)));
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
//ayarları yaparken .get yerine set ile aldığın değerleri eklemeye çalış merge'u unutma set ederken
