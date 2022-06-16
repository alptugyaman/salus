import 'dart:async';

import 'package:salus/config/global.dart';
import 'package:salus/core/constant/navigation/navigation_constants.dart';

class SplashViewModel {
  void route() {
    Timer(const Duration(seconds: 2), () => toHome());
  }

  void toHome() => Global.navigationService
      .navPushRemove(path: NavigationConstants.MASTER_VIEW);
}
