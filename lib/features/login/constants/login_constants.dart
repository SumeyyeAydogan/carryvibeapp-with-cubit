class LoginConstants {
  static const String USER_NOT_FOUND = "Böyle bir e-postaya ait kullanıcı bulunamadı.";
  static const String WRONG_PASSWORD = "Bu kullanıcı için parola yanlış.";
  static const String LOGIN = "Giriş Yap";
  static const String LOGIN_TITLE = "Hoşgeldin! Seni tekrar gördüğüme memnun oldum!";
  static const String SIGNIN_OR = "veya";
  static const String FORGOT_PASSWORD = "Şifrenizi mi Unuttunuz?";
}

// enum LoginEnum { userNotFound, wrongPassword }

// extension LoginExtension on LoginEnum {
//   String get authErrorMessage {
//     switch (this) {
//       case LoginEnum.userNotFound:
//         return LoginConstants.USER_NOT_FOUND;
//       case LoginEnum.wrongPassword:
//         return LoginConstants.WRONG_PASSWORD;
//     }
//   }
// }
