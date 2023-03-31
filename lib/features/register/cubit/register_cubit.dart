import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/register/constants/register_constants.dart';
import 'package:carryvibeapp/features/register/model/register_request_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

  Future<void> createUserWithEmailAndPassword(RegisterRequestModel model) async {
    emit(const RegisterLoading());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: model.email,
        password: model.password,
      )
          .then((user) {
        FirebaseFirestore.instance.collection('Users').doc(user.user?.uid).set(
              RegisterRequestModel(
                id: user.user!.uid,
                email: model.email,
                password: "",
                fullName: model.fullName,
                gainTotalNumber: 0,
                identityBirthDay: "",
                identityFirstName: "",
                identityLastName: "",
                identityNumber: "0",
                isIdentity: "false",
                phone: "",
                phoneAuth: false,
                profileImage: "",
                senderTotalNumber: 0,
                transportTotalNumber: 0,
              ).toJson(),
            );
        FirebaseAuth.instance.signOut();
      });
      emit(const RegisterCompleted(RegisterConstants.SUCCESS));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        emit(const RegisterError(RegisterConstants.WEAK_PASSWORD));
      } else if (e.code == 'email-already-in-use') {
        emit(const RegisterError(RegisterConstants.EXIST_EMAIL));
      }
    } catch (e) {
      emit(const RegisterError(RegisterConstants.ERROR_EXCEPTION));
    }
  }
}
