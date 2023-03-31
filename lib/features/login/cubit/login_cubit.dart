import 'package:bloc/bloc.dart';
import 'package:carryvibeapp/features/login/constants/login_constants.dart';
import 'package:carryvibeapp/features/login/model/login_model.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/service/locator.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(const LoginInitial());

  Future<void> signInWithEmailAndPassword({required LoginResponseModel model}) async {
    emit(const LoginLoading());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: model.email, password: model.password)
          .then((value) {
        if (value.user != null) {
          emit(const LoginCompleted());
          getIt<AppRouter>().pushAndPopUntil(const MainRoute(), predicate: (route) => false);
        }
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        emit(const LoginError(LoginConstants.USER_NOT_FOUND));
      } else if (e.code == 'wrong-password') {
        emit(const LoginError(LoginConstants.WRONG_PASSWORD));
      }
    }
  }
}
