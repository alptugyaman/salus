import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salus/config/global.dart';
import 'package:salus/config/locators.dart';
import 'package:salus/core/theme/app_theme.dart';
import 'package:salus/view/auth/splash/view/splash_view.dart';

Future<void> main() async {
  await _init();
  runApp(const MyApp());
}

Future<void> _init() async {
  WidgetsFlutterBinding.ensureInitialized();
  //* needed for firebase
  await Firebase.initializeApp();
  //* needed for dependency injection
  setupLocators();
  //* needed for hide keys
  await dotenv.load(fileName: '.env');
  // * creates a new user
  // Global.firebaseManager.saveUserToFirestore();
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) {
        return MaterialApp(
          title: 'Material App',
          theme: AppTheme.theme(),
          home: const SplashView(),
          onGenerateRoute: Global.navigationRoute.generateRoute,
          navigatorKey: Global.navigationService.navigatorKey,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [Locale('tr', 'TR')],
          locale: const Locale('tr', 'TR'),
          debugShowCheckedModeBanner: false,
        );
      },
    );
  }
}
