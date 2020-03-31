import 'package:flightflutter/core/init/navigation/navigation_service.dart';
import 'package:flightflutter/core/init/navigation/navigator_route_service.dart';
import 'package:flightflutter/googe_maps/view/googe_maps_view.dart';
import 'package:flutter/material.dart';

import 'core/device/theme/theme.dart';

void main() => runApp(MyApp());

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
