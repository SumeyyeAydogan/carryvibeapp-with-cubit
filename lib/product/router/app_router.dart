import 'package:auto_route/auto_route.dart';
import 'package:carryvibeapp/core/constants/navigation_constant.dart';
import 'package:carryvibeapp/features/delivery/view/delivery_view.dart';
import 'package:carryvibeapp/features/detail/view/detail_view.dart';
import 'package:carryvibeapp/features/forgot_password/view/forgot_password_view.dart';
import 'package:carryvibeapp/features/home/view/home_view.dart';
import 'package:carryvibeapp/features/introduction/view/introduction_view.dart';
import 'package:carryvibeapp/features/login/view/login_view.dart';
import 'package:carryvibeapp/features/main/main_page.dart';
import 'package:carryvibeapp/features/notifications/view/notifications_page.dart';
import 'package:carryvibeapp/features/posts/view/posts_view.dart';
import 'package:carryvibeapp/features/profile/view/profile_view.dart';
import 'package:carryvibeapp/features/register/view/register_view.dart';
import 'package:carryvibeapp/product/service/auth_guard.dart';
import 'package:flutter/material.dart';
part 'app_router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: IntroductionPage, path: NavigationConstants.INTRODUCTION),
    AutoRoute(page: LoginPage, path: NavigationConstants.LOGIN),
    AutoRoute(page: RegisterPage, path: NavigationConstants.REGISTER),
    AutoRoute(
        page: ForgotPasswordPage,
        guards: [AuthGuard],
        path: NavigationConstants.FORGOTPASSWORD),
    //AutoRoute(page: SenderPostPage, guards: [AuthGuard], path: NavigationConstants.SENDERPOSTVIEW),
    //AutoRoute(page: AddProductPage, guards: [AuthGuard], path: NavigationConstants.ADDPRODUCTVIEW),
    AutoRoute(
        page: RequestCreatePage,
        guards: [AuthGuard],
        path: NavigationConstants.REQUESTCREATEVIEW),
    AutoRoute(
        page: NotificationsPage,
        guards: [AuthGuard],
        path: NavigationConstants.NOTIFICATIONSVIEW),
    //BottomNavigation Bar Router Settings
    AutoRoute(
      page: MainPage,
      initial: true,
      guards: [AuthGuard],
      children: [
        AutoRoute(
          path: "home-tab",
          name: "HomeTabRouter",
          page: EmptyRouterPage,
          guards: [AuthGuard],
          children: [
            AutoRoute(path: "", page: HomePage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "carrier-tab",
          name: "CarrierTabRouter",
          page: EmptyRouterPage,
          guards: [AuthGuard],
          children: [
            AutoRoute(path: "", page: CarrierPostPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "profile-tab",
          name: "ProfileTabRouter",
          page: EmptyRouterPage,
          guards: [AuthGuard],
          children: [
            AutoRoute(path: "", page: ProfilePage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
        AutoRoute(
          path: "delivery-tab",
          name: "DeliveryTabRouter",
          page: EmptyRouterPage,
          guards: [AuthGuard],
          children: [
            AutoRoute(path: "", page: DeliveryPage),
            RedirectRoute(path: '*', redirectTo: ''),
          ],
        ),
      ],
    ),
  ],
)
// extend the generated private router
class AppRouter extends _$AppRouter {
  AppRouter({required super.authGuard});
}
