import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class FLightCacheImage extends StatelessWidget {
  final String imageUrl;

  const FLightCacheImage({Key key, this.imageUrl}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      fit: BoxFit.contain,
      placeholder: (context, url) {
        return CircularProgressIndicator();
      },
      errorWidget: (context, url, error) => Icon(Icons.error),
    );
  }
}
