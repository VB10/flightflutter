import 'package:flightflutter/core/device/constants.dart';
import 'package:flightflutter/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import './splash_view_model.dart';

class SplashView extends SplashViewModel {
  @override
  Widget build(BuildContext context) {
    // Replace this with your build function
    return Scaffold(
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.arrow_forward),
          onPressed: () {
            NavigationService.instance.navigateToReset(RouteConstants.HOME);
          }),
    );
  }
}
