import 'package:flightflutter/core/device/constants.dart';
import 'package:flightflutter/core/init/navigation/transitions/fade_route.dart';
import 'package:flightflutter/core/view/widgets/navigation/not_found.dart';
import 'package:flightflutter/googe_maps/view/googe_maps_view.dart';
import 'package:flightflutter/splash/splash.dart';
import 'package:flutter/material.dart';

class NavigationRouteManager {
  static Route<dynamic> onRouteGenerate(RouteSettings settings) {
    switch (settings.name) {
      case RouteConstants.HOME:
        return _navigateToFadeDeafult(GoogeMaps(), settings);
      case RouteConstants.SPLASH:
        return _navigateToDeafult(Splash(), settings);
      default:
        return MaterialPageRoute(builder: (_) => NotFoundNavigationWidget());
    }
  }

  NavigationRouteManager._init();

  static MaterialPageRoute _navigateToDeafult(
      Widget page, RouteSettings settings) {
    return MaterialPageRoute(builder: (context) => page, settings: settings);
  }

  static PageRoute _navigateToFadeDeafult(Widget page, RouteSettings settings) {
    return FadeRoute(page: page, settings: settings);
  }
}
