import 'package:flutter/material.dart';

class RowDivider extends StatelessWidget {
  final Color colors;
  final double indent;

  const RowDivider({Key key, this.colors, this.indent}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final pageWidth = MediaQuery.of(context).size.width;
    return Divider(
      color: Colors.grey,
      indent: pageWidth * (indent ?? 0),
      endIndent: pageWidth * (indent ?? 0),
      thickness: 2,
    );
  }
}
