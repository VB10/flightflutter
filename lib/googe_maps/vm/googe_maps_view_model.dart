import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../core/device/constants.dart';
import '../model/flight_map_model.dart';
import '../service/google_firebase_service.dart';
import '../view/googe_maps.dart';

abstract class GoogeMapsViewModel extends State<GoogeMaps> {
  GoogleFirebaseService _firebaseService = GoogleFirebaseService();
  BitmapDescriptor dogIcon;
  GoogleMapController controller;
  final firebaseServiceEndPoint = AppConstant.API_SERVICE_URL;

  List<FlightMap> flightList = [];
  final CameraPosition kLake =
      CameraPosition(target: AppConstant.TURKEY_CENTER_LAT_LONG, zoom: 7);

  void navigateToRoot(int index) {
    controller.animateCamera(CameraUpdate.newLatLng(flightList[index].latlong));
  }

  double pageWidth(BuildContext context) => MediaQuery.of(context).size.width;
  double pageHeight(BuildContext context) => MediaQuery.of(context).size.height;

  Future initMapItemList() async {
    final response = await _firebaseService.initMapItemList();
    if (response is List) {
      setState(() {
        flightList = response;
      });
      controller
          .animateCamera(CameraUpdate.newLatLng(flightList.first.latlong));
    }
  }
}
