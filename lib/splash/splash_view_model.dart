import 'package:flightflutter/core/device/constants.dart';
import 'package:flightflutter/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import './splash.dart';

abstract class SplashViewModel extends State<Splash> {
  // Add your state and logic here

  Future<void> controlToken(args) async {
    await Future.delayed(Duration(seconds: 3));
    // nagigateToHome();
  }

  void nagigateToHome() {
    NavigationService.instance.navigateToReset(RouteConstants.HOME);
  }
}
