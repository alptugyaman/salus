import 'package:flutter/material.dart';
import 'package:salus/config/locators.dart';
import 'package:salus/core/constant/image/image_constants.dart';
import 'package:salus/core/init/firebase/firebase_manager.dart';

import 'package:salus/core/init/navigation/navigation_route.dart';
import 'package:salus/core/init/navigation/navigation_service.dart';

class Global {
  static BuildContext context = navigationService.navigatorKey.currentContext!;
  static FirebaseManager firebaseManager = getIt<FirebaseManager>();
  static ImageConstants imageService = getIt<ImageConstants>();
  static NavigationRoute navigationRoute = getIt<NavigationRoute>();
  static NavigationService navigationService = getIt<NavigationService>();
}
