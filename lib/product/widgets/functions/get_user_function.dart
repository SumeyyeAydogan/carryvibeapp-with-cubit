import 'package:carryvibeapp/features/register/model/register_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../enums/api_collection_enum.dart';

Future<RegisterRequestModel?> getUser() async {
  final FirebaseAuth user = FirebaseAuth.instance;
  var gelenUser = await FirebaseFirestore.instance
      .collection(ApiCollectionEnum.userCollection.collectionName)
      .doc(user.currentUser?.uid)
      .get();

  RegisterRequestModel userModel = RegisterRequestModel(
      id: gelenUser.data()!['id'] ?? '',
      email: gelenUser.data()!['email'] ?? '',
      password: gelenUser.data()!['password'] ?? '',
      fullName: gelenUser.data()!['fullName'] ?? '',
      gainTotalNumber: gelenUser.data()!['gainTotalNumber'],
      identityBirthDay: gelenUser.data()!['identityBirthDay'] ?? '',
      identityFirstName: gelenUser.data()!['identityFirstName'] ?? '',
      identityLastName: gelenUser.data()!['identityLastName'] ?? '',
      identityNumber: gelenUser.data()!['identityNumber'] ?? '',
      isIdentity: gelenUser.data()!['isIdentity'],
      phone: gelenUser.data()!['phone'] ?? '',
      phoneAuth: gelenUser.data()!['phoneAuth'],
      profileImage: gelenUser.data()!['profileImage'] ?? '',
      senderTotalNumber: gelenUser.data()!['senderTotalNumber'],
      transportTotalNumber: gelenUser.data()!['transportTotalNumber']);

  return userModel;
}
