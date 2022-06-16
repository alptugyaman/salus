import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salus/core/components/scaffold/not_found.dart';
import 'package:salus/core/constant/navigation/navigation_constants.dart';
import 'package:salus/view/auth/splash/view/splash_view.dart';
import 'package:salus/view/master/view/master_view.dart';
import 'package:salus/view/messages/client/model/client_model.dart';
import 'package:salus/view/messages/message_detail/view/message_detail_view.dart';

class NavigationRoute {
  Route<dynamic> generateRoute(RouteSettings args) {
    switch (args.name) {

      //!      AUTH      //
      case NavigationConstants.SPLASH_VIEW:
        return defaultNavigate(const SplashView());

      //?       PAGES      //
      case NavigationConstants.MASTER_VIEW:
        return defaultNavigate(const MasterView());

      case NavigationConstants.MESSAGE_DETAIL_VIEW:
        return defaultNavigate(MessageDetailView(
          client: args.arguments as Client,
        ));

      //*       DEFAULT      //
      default:
        return defaultNavigate(const NotFound());
    }
  }

  PageRoute defaultNavigate(Widget widget) => Platform.isIOS
      ? CupertinoPageRoute(builder: (context) => widget)
      : MaterialPageRoute(builder: (context) => widget);
}
