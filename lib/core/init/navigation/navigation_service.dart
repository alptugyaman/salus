import 'package:flutter/material.dart';

class NavigationService {
  late GlobalKey<NavigatorState> navigatorKey;

  static NavigationService instance = NavigationService();

  NavigationService() {
    navigatorKey = GlobalKey<NavigatorState>();
  }

  bool _removeAll(Route<dynamic> route) => false;

  Future<void> push({String? path, Object? object}) async {
    await navigatorKey.currentState!.pushNamed(path!, arguments: object);
  }

  Future<void> navPushRemove({String? path, Object? object}) async {
    await navigatorKey.currentState!
        .pushNamedAndRemoveUntil(path!, _removeAll, arguments: object);
  }

  void pop({Object? result}) {
    return navigatorKey.currentState!.pop(result);
  }
}
