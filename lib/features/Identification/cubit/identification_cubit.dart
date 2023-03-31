import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/Identification/cubit/identification_state.dart';
import 'package:carryvibeapp/features/Identification/identification_manager.dart';
import 'package:carryvibeapp/features/Identification/model/identification_request_model.dart';
import 'package:carryvibeapp/features/login/constants/login_constants.dart';
import 'package:carryvibeapp/features/login/model/login_model.dart';
import 'package:carryvibeapp/features/posts/constants/add_post_constants.dart';
import 'package:carryvibeapp/product/enums/api_collection_enum.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/service/locator.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../register/model/register_request_model.dart';

//part '../../posts/cubit/identification_state.dart';

class IdentificationCubit extends Cubit<IdentificationState> {
  IdentificationCubit() : super(IdentificationInitial());

  Future<void> verify({required RegisterRequestModel model}) async {
    final FirebaseAuth user = FirebaseAuth.instance;
    //emit(const IdentificationLoading());
    try {
      final response = await IdentityManager.instance.getCheck(
          model: IdentificationRequestModel(
        identityNumber: model.identityNumber,
        name: model.identityFirstName,
        surname: model.identityLastName,
        birthYear: model.identityBirthDay,
      ));
      if (response == "true") {
        emit(IdentificationCompleted(AddPostConstants.SUCCESS));
      }
      else
      {
        emit(const IdentificationError("TC Kimlik Doğrulaması Başarısız"));
      }
      print("doğrulama retun etti ${model.isIdentity}");
      
      await FirebaseFirestore.instance
          .collection(ApiCollectionEnum.userCollection.collectionName)
          .doc(user.currentUser?.uid)
          .set(
            RegisterRequestModel(
                    id: model.id,
                    email: model.email,
                    password: model.password,
                    fullName: model.fullName,
                    gainTotalNumber: model.gainTotalNumber,
                    identityBirthDay: model.identityBirthDay,
                    identityFirstName: model.identityFirstName,
                    identityLastName: model.identityLastName,
                    identityNumber: model.identityNumber,
                    isIdentity: response!,
                    phone: model.phone,
                    phoneAuth: model.phoneAuth,
                    profileImage: model.profileImage,
                    senderTotalNumber: model.senderTotalNumber,
                    transportTotalNumber: model.transportTotalNumber)
                .toJson(),
            SetOptions(merge: true),
          );
      //if (response == "true") {
        
      //}else{
      //  
      //}
      /* IdentityManager.instance.getCheck(model: IdentificationRequestModel(
                                      identityNumber: _number.text,
                                      name: _name.text,
                                      surname: _surname.text,
                                      birthYear: _birthYear.text,
                                    )); */
    } catch (e) {
        emit(const IdentificationError(LoginConstants.USER_NOT_FOUND));
    }
  }
}

/* verify({
  required id,
  required identityNumber,
  required name,
  required surname,
  required birthyear,
}) {
  //IdentityManager();
} */
