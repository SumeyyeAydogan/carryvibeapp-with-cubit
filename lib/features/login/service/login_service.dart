import 'package:firebase_auth/firebase_auth.dart';

abstract class ILoginService {
  Future<void> signInNormal();
}

class LoginService implements ILoginService {
  @override
  Future<void> signInNormal() async {}
}
