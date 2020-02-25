import 'dart:convert';

import 'package:google_maps_flutter/google_maps_flutter.dart';

class FlightMap {
  String country;
  double lat;
  double long;

  FlightMap({this.country, this.lat, this.long});

  FlightMap.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is FlightMap &&
        o.country == country &&
        o.lat == lat &&
        o.long == long;
  }

  @override
  int get hashCode => country.hashCode ^ lat.hashCode ^ long.hashCode;
}

extension FligtLatLong on FlightMap {
  LatLng get latlong => LatLng(this.lat, this.long);
}
