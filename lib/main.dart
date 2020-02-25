import 'package:flutter/material.dart';

import 'googe_maps/view/googe_maps.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(title: 'Material App', home: GoogeMaps());
  }
}
