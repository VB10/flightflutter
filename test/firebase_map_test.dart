import 'dart:convert';
import 'dart:io';

import 'package:flightflutter/googe_maps/flight_map_model.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;

main() {
  final firebaseServiceEndPoint = "https://fluttertr-ead5c.firebaseio.com/maps";

  test('firebase map test', () async {
    final response = await http.get("$firebaseServiceEndPoint.json");

    var responseData;
    switch (response.statusCode) {
      case HttpStatus.ok:
        final jsonData = jsonDecode(response.body);
        if (jsonData is List) {
          responseData = jsonData
              .map((e) => FlightMap.fromJson(e))
              .cast<FlightMap>()
              .toList();
        } else if (jsonData is Map) {
        } else
          return jsonData;
        break;
      default:
    }

    expect(responseData is List, true);
  });
}
