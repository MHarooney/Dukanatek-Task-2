import 'package:dukanatek/routs/RoutsNames.dart';
import 'package:dukanatek/screens/home/HomeScreen.dart';
import 'package:dukanatek/screens/login/view/LoginScreen.dart';
import 'package:dukanatek/screens/not_found_screen/NotFoundScreen.dart';
import 'package:dukanatek/screens/onBoarding/onBoarding_screen.dart';
import 'package:dukanatek/screens/register/view/RegisterScreen.dart';
import 'package:dukanatek/screens/splash/SplashScreen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RoutingData.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    var uriData = Uri.parse(settings.name!);

    var routingData = RoutingData(
      queryParameters: uriData.queryParameters,
      route: uriData.path,
    );

    switch (routingData.route) {
      case RouteName.SPLASH:
        return _getPageRoute(SplashScreen(), settings);
      case RouteName.LOGIN:
        return _getPageRoute(LoginScreen(), settings);
        case RouteName.ON_BOARDING:
        return _getPageRoute(OnBoardingScreen(), settings);
      case RouteName.HOME:
        return _getPageRoute(HomeScreen(), settings);
      case RouteName.REGISTER:
        return _getPageRoute(RegisterScreen(), settings);
      default:
        return _getPageRoute(NotFoundScreen(), settings);
    }
  }
}

PageRoute _getPageRoute(Widget child, RouteSettings settings) {
  return _FadeRoute(child: child, routeName: settings.name);
}

class _FadeRoute extends PageRouteBuilder {
  final Widget? child;
  final String? routeName;

  _FadeRoute({this.child, this.routeName})
      : super(
          settings: RouteSettings(name: routeName),
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              child!,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              FadeTransition(
            opacity: animation,
            child: child,
          ),
        );
}