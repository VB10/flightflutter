import 'package:flightflutter/core/device/constants.dart';

class BaseService {
  final firebaseServiceEndPoint = AppConstant.API_SERVICE_URL;

  String get mapsPath => "$firebaseServiceEndPoint/maps.json";
}
