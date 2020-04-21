import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import 'core/device/theme/theme.dart';
import 'core/init/navigation/navigation_service.dart';
import 'core/init/navigation/navigator_route_service.dart';

Future<void> main() async {
  await init();
  runApp(MyApp());
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
