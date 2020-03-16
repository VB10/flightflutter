import 'package:flutter/material.dart';

abstract class BaseState<T extends StatefulWidget> extends State<T> {
  double pageWidthDyanmic(double val) =>
      MediaQuery.of(context).size.width * val;
  double pageHeightDyanmic(double val) =>
      MediaQuery.of(context).size.height * val;
}
