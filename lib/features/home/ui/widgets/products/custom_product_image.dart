import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.isDrawerOpen, required this.productImage});

  final bool isDrawerOpen;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: productImage,
      imageBuilder: (context, imageProvider) =>  Container(
        width: isDrawerOpen ? 80.w : 150.w,
        height: isDrawerOpen ? 100.h : 150.h,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(
              productImage,
            ),
            fit: BoxFit.fill,
          ),
        ),
      ),
      placeholder: (context, url) => SizedBox(
        width: isDrawerOpen ? 20.w : 40.w,
        height: isDrawerOpen ? 20.h : 40.h,
        child: const CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) =>
      const Icon(Icons.error),
    );
  }
}
