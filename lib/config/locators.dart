import 'package:get_it/get_it.dart';
import 'package:salus/core/constant/image/image_constants.dart';
import 'package:salus/core/init/firebase/firebase_manager.dart';
import 'package:salus/core/init/navigation/navigation_route.dart';
import 'package:salus/core/init/navigation/navigation_service.dart';

var getIt = GetIt.instance;

//* Why GetIt
//? As your App grows, at some point you will need to put your app's logic in classes that are separated from your Widgets.
//? Keeping your widgets from having direct dependencies makes your code better organized and easier to test and maintain.
//? But now you need a way to access these objects from your UI code. When I came to Flutter from the .Net world, the only way to do this was the use of InheritedWidgets.
//? I found the way to use them by wrapping them in a StatefulWidget; quite cumbersome and has problems working consistently. Also:
//? I missed the ability to easily switch the implementation for a mocked version without changing the UI.
//? The fact that you need a BuildContext to access your objects made it inaccessible from the Business layer.

void setupLocators() {
  getIt.registerLazySingleton(() => ImageConstants());
  getIt.registerLazySingleton(() => NavigationService());
  getIt.registerLazySingleton(() => NavigationRoute());
  getIt.registerLazySingleton(() => FirebaseManager());
}
