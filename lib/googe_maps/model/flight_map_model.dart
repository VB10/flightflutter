import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:json_annotation/json_annotation.dart';

part 'flight_map_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.pascal)
class FlightMap {
  String country;
  Detail detail;
  @JsonKey(name: "ahmet")
  double lat;
  double long;

  FlightMap({this.country, this.detail, this.lat, this.long});

  factory FlightMap.fromJson(Map<String, dynamic> json) =>
      _$FlightMapFromJson(json);

  Map<String, dynamic> toJson() => _$FlightMapToJson(this);
}

@JsonSerializable()
class Detail {
  String description;
  String name;
  String photoUrl;
  String status;
  List<Tags> tags;

  Detail({this.description, this.name, this.photoUrl, this.status, this.tags});

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);

  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
class Tags {
  int id;
  String name;

  Tags({this.id, this.name});

  factory Tags.fromJson(Map<String, dynamic> json) => _$TagsFromJson(json);

  Map<String, dynamic> toJson() => _$TagsToJson(this);
}

extension FligtLatLong on FlightMap {
  LatLng get latlong => LatLng(this.lat, this.long);
}
