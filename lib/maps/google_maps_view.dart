import 'package:flightflutter/googe_maps/googe_maps.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class GoogleMapsView extends StatefulWidget {
  @override
  _GoogleMapsViewState createState() => _GoogleMapsViewState();
}

class _GoogleMapsViewState extends State<GoogleMapsView> {
  GoogleMapController controller;
  static final CameraPosition _kLake = CameraPosition(
      target: LatLng(40.9130116, 29.2094771), zoom: 19.151926040649414);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.animateCamera(
              CameraUpdate.newLatLng(LatLng(40.9906621, 29.0200943)));
        },
      ),
      body: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kLake,
        onMapCreated: (map) async {
          controller = map;
          await _createMarkerImageFromAsset(context);
        },
        markers: _createMarker(),
      ),
    );
  }

  BitmapDescriptor dogIcon;

  Future<void> _createMarkerImageFromAsset(BuildContext context) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    var bitmap = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/images/dog.png');
    dogIcon = bitmap;
    setState(() {});
    // print(dogIcon);
  }

  Set<Marker> _createMarker() {
    return <Marker>[
      Marker(
          markerId: MarkerId("asdad"),
          position: _kLake.target,
          icon: dogIcon,
          zIndex: 10,
          infoWindow: InfoWindow(title: "Hello Dog"))
    ].toSet();
  }
}
