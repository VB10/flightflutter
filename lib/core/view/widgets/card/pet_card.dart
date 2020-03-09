import 'package:flutter/material.dart';

import '../image/cached_image.dart';

class PetCard extends StatelessWidget {
  final String imageUrl;
  final String title;
  final VoidCallback onPressed;

  const PetCard({Key key, this.imageUrl, this.title, this.onPressed})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(),
      child: Card(
        child: Center(
          child: buildListTile(),
        ),
      ),
    );
  }

  ListTile buildListTile() {
    return ListTile(
      title: Text(title),
      trailing: FLightCacheImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
