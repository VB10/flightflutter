import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flightflutter/core/device/constants.dart';
import 'package:flightflutter/googe_maps/model/flight_map_model.dart';
import 'package:flightflutter/googe_maps/service/google_firebase_service.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:mobx/mobx.dart';

part 'maps_vm.g.dart';

class MapsViewModel = MapsViewBase with _$MapsViewModel;

abstract class MapsViewBase with Store {
  BuildContext context;
  GoogleFirebaseService _firebaseService = GoogleFirebaseService();
  GoogleMapController controller;
  final firebaseServiceEndPoint = AppConstant.API_SERVICE_URL;

  @observable
  String title;
  @observable
  BitmapDescriptor dogIcon;

  @observable
  List<FlightMap> flightList = [];

  @action
  void changeAppBarName(String text) {
    print(text);
    title = text;
  }

  void changeLanguage() {
    context.locale = AppConstant.SUPPORTED_LOCALE[
        Random().nextInt(AppConstant.SUPPORTED_LOCALE.length)];
  }

  void setContext(BuildContext context) {
    this.context = context;
    Future.microtask(() => initMapItemList());
  }

  final CameraPosition kLake =
      CameraPosition(target: AppConstant.TURKEY_CENTER_LAT_LONG, zoom: 7);

  void navigateToRoot(int index) {
    controller.animateCamera(CameraUpdate.newLatLng(flightList[index].latlong));
  }

  Future initMapItemList() async {
    final response = await _firebaseService.initMapItemList();
    if (response is List) {
      flightList = response;
      controller
          .animateCamera(CameraUpdate.newLatLng(flightList.first.latlong));
    }
  }

  void changePageViewCardIndex(int index) {
    changeAppBarName(flightList[index].country);
    navigateToRoot(index);
  }

  void mapsCardOnPressed() {
    controller.animateCamera(
        CameraUpdate.newLatLng(AppConstant.TURKEY_CENTER_LAT_LONG));
  }

  Future<void> mapsInit(GoogleMapController controller) async {
    this.controller = controller;
    await createMarkerImageFromAsset();
  }

  Future<void> createMarkerImageFromAsset() async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    var bitmap = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/images/dog.png');
    dogIcon = bitmap;
  }
}
