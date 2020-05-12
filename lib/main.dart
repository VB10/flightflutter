import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flightflutter/core/device/constants.dart';
import 'package:flutter/material.dart';

import 'core/device/theme/theme.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/navigation/navigator_route_service.dart';

Future<void> main() async {
  await init();
  runApp(
    EasyLocalization(
        child: MyApp(),
        supportedLocales: AppConstant.SUPPORTED_LOCALE,
        path: AppConstant.LANG_PATH),
  );
}

FirebaseMessaging firebaseMessaging = FirebaseMessaging();

Future<void> init() async {
  WidgetsFlutterBinding.ensureInitialized();
  await firebaseMessaging.requestNotificationPermissions();
  final token = await firebaseMessaging.getToken();
  print(token);
  await firebaseMessaging.subscribeToTopic("topics-all");
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Petti',
      initialRoute: '/splash',
      theme: myTheme,
      onGenerateRoute: (settings) =>
          NavigationRouteManager.onRouteGenerate(settings),
      navigatorKey: NavigationService.instance.navigatorKey,
    );
  }
}
