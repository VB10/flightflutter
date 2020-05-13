import 'package:flutter/rendering.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class AppConstant {
  static const TURKEY_CENTER_LAT_LONG = LatLng(38.9637, 35.2433);
  static const API_SERVICE_URL = "https://fluttertr-ead5c.firebaseio.com";

  static const DOG_SVG = "assets/images/svg/dog_walking.svg";
  static const DOG_LOTTIE = "dog_walking";

  static const SUPPORTED_LOCALE = [
    AppConstant.EN_LOCALE,
    AppConstant.AR_LOCALE
  ];

  static const TR_LOCALE = Locale("tr", "TR");
  static const AR_LOCALE = Locale("ar", "DZ");
  static const EN_LOCALE = Locale("en", "US");
  static const LANG_PATH = "assets/lang";
}

class RouteConstants {
  static const String HOME = "/home";
  static const String SPLASH = "/splash";
}
