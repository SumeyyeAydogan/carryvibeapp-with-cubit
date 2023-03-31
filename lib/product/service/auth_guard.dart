import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/navigation_constant.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) async {
    if (FirebaseAuth.instance.currentUser == null) {
      router.replaceNamed(NavigationConstants.INTRODUCTION);
      debugPrint('User is currently signed out!');
    } else {
      debugPrint('User is signed in!');
      resolver.next(true);
    }
  }
}
