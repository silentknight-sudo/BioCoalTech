import 'package:flutter/material.dart';

class NavigationService {
  static GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static Future<dynamic> navigateTo(String routeName, {Object? arguments}) {
    return navigatorKey.currentState!.pushNamed(routeName, arguments: arguments);
  }

  static void goBack() {
    return navigatorKey.currentState!.pop();
  }
}

class AppRoutes {
  static const String dashboard = '/dashboard';
  static const String monitoring = '/monitoring';
  static const String marketplace = '/marketplace';
  static const String profile = '/profile';
  static const String settings = '/settings';
}
