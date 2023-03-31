// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'app_router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter(
      {GlobalKey<NavigatorState>? navigatorKey, required this.authGuard})
      : super(navigatorKey);

  final AuthGuard authGuard;

  @override
  final Map<String, PageFactory> pagesMap = {
    IntroductionRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const IntroductionPage());
    },
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const LoginPage());
    },
    RegisterRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const RegisterPage());
    },
    ForgotPasswordRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ForgotPasswordPage());
    },
    RequestCreateRoute.name: (routeData) {
      final args = routeData.argsAs<RequestCreateRouteArgs>(
          orElse: () => const RequestCreateRouteArgs());
      return AdaptivePage<dynamic>(
          routeData: routeData, child: RequestCreatePage(key: args.key));
    },
    NotificationsRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const NotificationsPage());
    },
    MainRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const MainPage());
    },
    HomeTabRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    CarrierTabRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    ProfileTabRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    DeliveryTabRouter.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const EmptyRouterPage());
    },
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    CarrierPostRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: CarrierPostPage());
    },
    ProfileRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const ProfilePage());
    },
    DeliveryRoute.name: (routeData) {
      return AdaptivePage<dynamic>(routeData: routeData, child: DeliveryPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(IntroductionRoute.name, path: '/introduction'),
        RouteConfig(LoginRoute.name, path: '/login'),
        RouteConfig(RegisterRoute.name, path: '/register'),
        RouteConfig(ForgotPasswordRoute.name,
            path: '/forgotPassword', guards: [authGuard]),
        RouteConfig(RequestCreateRoute.name,
            path: '/requestCreateView', guards: [authGuard]),
        RouteConfig(NotificationsRoute.name,
            path: '/notificationsView', guards: [authGuard]),
        RouteConfig(MainRoute.name, path: '/', guards: [
          authGuard
        ], children: [
          RouteConfig(HomeTabRouter.name,
              path: 'home-tab',
              parent: MainRoute.name,
              guards: [
                authGuard
              ],
              children: [
                RouteConfig(HomeRoute.name,
                    path: '', parent: HomeTabRouter.name),
                RouteConfig('*#redirect',
                    path: '*',
                    parent: HomeTabRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          RouteConfig(CarrierTabRouter.name,
              path: 'carrier-tab',
              parent: MainRoute.name,
              guards: [
                authGuard
              ],
              children: [
                RouteConfig(CarrierPostRoute.name,
                    path: '', parent: CarrierTabRouter.name),
                RouteConfig('*#redirect',
                    path: '*',
                    parent: CarrierTabRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          RouteConfig(ProfileTabRouter.name,
              path: 'profile-tab',
              parent: MainRoute.name,
              guards: [
                authGuard
              ],
              children: [
                RouteConfig(ProfileRoute.name,
                    path: '', parent: ProfileTabRouter.name),
                RouteConfig('*#redirect',
                    path: '*',
                    parent: ProfileTabRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ]),
          RouteConfig(DeliveryTabRouter.name,
              path: 'delivery-tab',
              parent: MainRoute.name,
              guards: [
                authGuard
              ],
              children: [
                RouteConfig(DeliveryRoute.name,
                    path: '', parent: DeliveryTabRouter.name),
                RouteConfig('*#redirect',
                    path: '*',
                    parent: DeliveryTabRouter.name,
                    redirectTo: '',
                    fullMatch: true)
              ])
        ])
      ];
}

/// generated route for
/// [IntroductionPage]
class IntroductionRoute extends PageRouteInfo<void> {
  const IntroductionRoute()
      : super(IntroductionRoute.name, path: '/introduction');

  static const String name = 'IntroductionRoute';
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute() : super(LoginRoute.name, path: '/login');

  static const String name = 'LoginRoute';
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute() : super(RegisterRoute.name, path: '/register');

  static const String name = 'RegisterRoute';
}

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordRoute extends PageRouteInfo<void> {
  const ForgotPasswordRoute()
      : super(ForgotPasswordRoute.name, path: '/forgotPassword');

  static const String name = 'ForgotPasswordRoute';
}

/// generated route for
/// [RequestCreatePage]
class RequestCreateRoute extends PageRouteInfo<RequestCreateRouteArgs> {
  RequestCreateRoute({Key? key})
      : super(RequestCreateRoute.name,
            path: '/requestCreateView', args: RequestCreateRouteArgs(key: key));

  static const String name = 'RequestCreateRoute';
}

class RequestCreateRouteArgs {
  const RequestCreateRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'RequestCreateRouteArgs{key: $key}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute()
      : super(NotificationsRoute.name, path: '/notificationsView');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(MainRoute.name, path: '/', initialChildren: children);

  static const String name = 'MainRoute';
}

/// generated route for
/// [EmptyRouterPage]
class HomeTabRouter extends PageRouteInfo<void> {
  const HomeTabRouter({List<PageRouteInfo>? children})
      : super(HomeTabRouter.name, path: 'home-tab', initialChildren: children);

  static const String name = 'HomeTabRouter';
}

/// generated route for
/// [EmptyRouterPage]
class CarrierTabRouter extends PageRouteInfo<void> {
  const CarrierTabRouter({List<PageRouteInfo>? children})
      : super(CarrierTabRouter.name,
            path: 'carrier-tab', initialChildren: children);

  static const String name = 'CarrierTabRouter';
}

/// generated route for
/// [EmptyRouterPage]
class ProfileTabRouter extends PageRouteInfo<void> {
  const ProfileTabRouter({List<PageRouteInfo>? children})
      : super(ProfileTabRouter.name,
            path: 'profile-tab', initialChildren: children);

  static const String name = 'ProfileTabRouter';
}

/// generated route for
/// [EmptyRouterPage]
class DeliveryTabRouter extends PageRouteInfo<void> {
  const DeliveryTabRouter({List<PageRouteInfo>? children})
      : super(DeliveryTabRouter.name,
            path: 'delivery-tab', initialChildren: children);

  static const String name = 'DeliveryTabRouter';
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [CarrierPostPage]
class CarrierPostRoute extends PageRouteInfo<void> {
  const CarrierPostRoute() : super(CarrierPostRoute.name, path: '');

  static const String name = 'CarrierPostRoute';
}

/// generated route for
/// [ProfilePage]
class ProfileRoute extends PageRouteInfo<void> {
  const ProfileRoute() : super(ProfileRoute.name, path: '');

  static const String name = 'ProfileRoute';
}

/// generated route for
/// [DeliveryPage]
class DeliveryRoute extends PageRouteInfo<void> {
  const DeliveryRoute() : super(DeliveryRoute.name, path: '');

  static const String name = 'DeliveryRoute';
}
