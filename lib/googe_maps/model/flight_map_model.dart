import 'package:google_maps_flutter/google_maps_flutter.dart';

class FlightMap {
  String country;
  Detail detail;
  double lat;
  double long;

  FlightMap({this.country, this.detail, this.lat, this.long});

  FlightMap.fromJson(Map<String, dynamic> json) {
    country = json['country'];
    detail =
        json['detail'] != null ? new Detail.fromJson(json['detail']) : null;
    lat = json['lat'];
    long = json['long'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['country'] = this.country;
    if (this.detail != null) {
      data['detail'] = this.detail.toJson();
    }
    data['lat'] = this.lat;
    data['long'] = this.long;
    return data;
  }
}

class Detail {
  String description;
  String name;
  String photoUrl;
  String status;
  List<Tags> tags;

  Detail({this.description, this.name, this.photoUrl, this.status, this.tags});

  Detail.fromJson(Map<String, dynamic> json) {
    description = json['description'];
    name = json['name'];
    photoUrl = json['photoUrl'];
    status = json['status'];
    if (json['tags'] != null) {
      tags = new List<Tags>();
      json['tags'].forEach((v) {
        tags.add(new Tags.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['description'] = this.description;
    data['name'] = this.name;
    data['photoUrl'] = this.photoUrl;
    data['status'] = this.status;
    if (this.tags != null) {
      data['tags'] = this.tags.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Tags {
  int id;
  String name;

  Tags({this.id, this.name});

  Tags.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    return data;
  }
}

extension FligtLatLong on FlightMap {
  LatLng get latlong => LatLng(this.lat, this.long);
}
