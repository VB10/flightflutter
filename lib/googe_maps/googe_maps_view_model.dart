import 'package:flightflutter/core/device/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import './googe_maps.dart';

abstract class GoogeMapsViewModel extends State<GoogeMaps> {
  BitmapDescriptor dogIcon;
  GoogleMapController controller;

  final CameraPosition kLake =
      CameraPosition(target: AppConstant.TURKEY_CENTER_LAT_LONG, zoom: 4);

  Future<void> createMarkerImageFromAsset(BuildContext context) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    var bitmap = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/images/dog.png');
    dogIcon = bitmap;
    setState(() {});
    // print(dogIcon);
  }

  Set<Marker> createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("asdad"),
          position: kLake.target,
          icon: dogIcon,
          zIndex: 10,
          infoWindow: InfoWindow(title: "Hello Dog"))
    ].toSet();
  }
}
