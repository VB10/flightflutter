import 'package:flightflutter/core/device/constants.dart';
import 'package:flightflutter/core/init/navigation/navigation_service.dart';
import 'package:flutter/material.dart';
import '../main.dart';
import './splash.dart';

abstract class SplashViewModel extends State<Splash> {
  // Add your state and logic here
  double imageOpacity = 0;
  bool showIndicator = false;

  Future<void> controlToken(args) async {
    await Future.delayed(Duration(seconds: 3));
    // nagigateToHome();
  }

  void nagigateToHome() {
    NavigationService.instance.navigateToReset(RouteConstants.HOME);
  }

  void showIndicatorSplashView() {
    Future.microtask(() async {
      controlToken("");
      setState(() {
        imageOpacity = 1;
      });
      await Future.delayed(Duration(seconds: 1));
      setState(() {
        showIndicator = true;
      });
    });
  }

  void handlerNotification() {
    firebaseMessaging.configure(
      onLaunch: (message) {
        print("OnLAUNCH $message");

        return Future.value(true);
      },
      onMessage: (message) {
        print("OnMessage $message");
        showDialog(
          context: context,
          builder: (context) => Dialog(
            child: Text(message["notification"]["title"]),
          ),
        );
        return Future.value(true);
      },
      onResume: (message) {
        print("OnResume $message");
        return Future.value(true);
      },
    );
  }
}
