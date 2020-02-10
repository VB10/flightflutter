import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

import './googe_maps.dart';
import '../core/device/constants.dart';
import 'flight_map_model.dart';

abstract class GoogeMapsViewModel extends State<GoogeMaps> {
  BitmapDescriptor dogIcon;
  GoogleMapController controller;
  final firebaseServiceEndPoint = "https://fluttertr-ead5c.firebaseio.com/maps";

  List<FlightMap> flightList = [];
  final CameraPosition kLake =
      CameraPosition(target: AppConstant.TURKEY_CENTER_LAT_LONG, zoom: 7);

  Future initMapItemList() async {
    final response = await http.get("$firebaseServiceEndPoint.json");
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          flightList = jsonData
              .map((e) => FlightMap.fromJson(e))
              .cast<FlightMap>()
              .toList();
          controller
              .animateCamera(CameraUpdate.newLatLng(flightList.first.latlong));
          setState(() {});
        } else if (jsonData is Map) {
          // TODO
        } else
          return jsonData;
        break;
      default:
    }
  }
}
