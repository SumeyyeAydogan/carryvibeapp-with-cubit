import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/service/auth_guard.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<AppRouter>(AppRouter(authGuard: AuthGuard()));
}
