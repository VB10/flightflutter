import 'package:flightflutter/core/init/extension/string_extensions.dart';
import 'package:flightflutter/core/init/locale_keys.g.dart';
import 'package:flightflutter/core/view/widgets/text/locale_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import './splash_view_model.dart';
import '../core/device/constants.dart';
import '../core/view/widgets/lottie/lottie_widget.dart';

class SplashView extends SplashViewModel {
  double imageOpacity = 0;
  @override
  void initState() {
    super.initState();
    handlerNotification();
    showIndicatorSplashView();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: buildFloatingActionButton(),
      body: Column(
        children: <Widget>[
          Spacer(flex: 2),
          Expanded(flex: 4, child: LottieCustomWidget(path: "paws_animation")),
          Expanded(flex: 4, child: buildRowMessage())
        ],
      ),
    );
  }

  FloatingActionButton buildFloatingActionButton() {
    return FloatingActionButton.extended(
        label: LocaleText(text: LocaleKeys.splash_petPageOpen),
        icon: Icon(Icons.arrow_forward),
        onPressed: () => nagigateToHome());
  }

  Row buildRowMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        LocaleText(text: LocaleKeys.splash_hello),
        buildVisibilityIndicator()
      ],
    );
  }

  Visibility buildVisibilityIndicator() {
    return Visibility(
      visible: showIndicator,
      child: CircularProgressIndicator(),
    );
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
