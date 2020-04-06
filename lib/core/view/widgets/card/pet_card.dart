import 'package:flightflutter/core/view/widgets/lottie/lottie_widget.dart';
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
      leading: LottieCustomWidget(path: "paws_animation"),
      trailing: FLightCacheImage(
        imageUrl: imageUrl,
      ),
    );
  }
}
