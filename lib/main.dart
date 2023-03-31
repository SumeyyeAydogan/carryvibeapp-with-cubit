import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/application_constants.dart';
import 'package:carryvibeapp/core/init/theme/carry_vibe_theme.dart';
import 'package:carryvibeapp/features/posts/cubit/carrier_and_sender_cubit.dart';
import 'package:carryvibeapp/firebase_options.dart';
import 'package:carryvibeapp/product/router/app_router.dart';
import 'package:carryvibeapp/product/service/locator.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Geolocator.requestPermission();
  setup();
  runApp(MultiRepositoryProvider(providers: [
   RepositoryProvider(create: (_)=> CarrierAndSenderCubit(null))
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  final router = getIt<AppRouter>();
  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: CarryVibeTheme.defaultTheme,
      title: ApplicationConstants.APP_NAME,
      routerDelegate: AutoRouterDelegate(router),
      routeInformationParser: router.defaultRouteParser(),
    );
  }
}
