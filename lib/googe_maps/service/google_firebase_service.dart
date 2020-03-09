import 'dart:convert';
import 'dart:io';

import 'package:http/http.dart' as http;

import '../../core/base/base_service.dart';
import '../model/flight_map_model.dart';
import 'IGoogleFirebaseService.dart';

class GoogleFirebaseService extends BaseService
    implements IGoogleFirebaseService {
  Future initMapItemList() async {
    final response = await http.get(mapsPath);
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          final data = jsonData
              .map((e) => FlightMap.fromJson(e))
              .cast<FlightMap>()
              .toList();
          return data;
        } else if (jsonData is Map) {
          return FlightMap.fromJson(jsonData);
        } else
          return jsonData;
        break;
      default:
    }
  }
}
