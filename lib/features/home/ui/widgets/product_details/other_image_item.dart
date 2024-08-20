import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class OtherImageItem extends StatelessWidget {
  const OtherImageItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, imageProvider) => Container(
        height: (MediaQuery.sizeOf(context).width - 100) / 4,
        width: (MediaQuery.sizeOf(context).width - 100) / 4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            fit: BoxFit.fill,
            image: NetworkImage(imageUrl),
          ),
        ),
      ),
      placeholder: (context, url) => const SizedBox(
        height: 30,
        width: 30,
        child: FittedBox(child: CircularProgressIndicator()),
      ),
    );
  }
}
