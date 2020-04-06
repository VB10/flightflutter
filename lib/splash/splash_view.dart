import 'package:flightflutter/core/view/widgets/lottie/lottie_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lottie/lottie.dart';

import './splash_view_model.dart';
import '../core/device/constants.dart';

class SplashView extends SplashViewModel {
  double imageOpacity = 0;
  bool showIndicator = false;
  @override
  void initState() {
    super.initState();

    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) {});
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(flex: 4, child: LottieCustomWidget(path: "cute_doggie")),
          Expanded(flex: 4, child: buildRowMessage())
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton(
        child: Icon(Icons.arrow_forward), onPressed: () => nagigateToHome());
  }

  Row buildRowMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[Text("Hello"), buildVisibilityIndicator()],
    );
  }

  Visibility buildVisibilityIndicator() {
    return Visibility(
        visible: showIndicator, child: CircularProgressIndicator());
  }

  AnimatedOpacity buildAnimatedOpacityImage() {
    return AnimatedOpacity(
      opacity: imageOpacity,
      duration: Duration(seconds: 2),
      child: SvgPicture.asset(
        AppConstant.DOG_SVG,
      ),
    );
  }

  Widget buildAnimatedOpacityLottie() {
    return AnimatedOpacity(
      opacity: imageOpacity,
      duration: Duration(seconds: 2),
      child: LottieCustomWidget(path: AppConstant.DOG_LOTTIE),
    );
  }
}
