import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.isDrawerOpen, required this.productImage});

  final bool isDrawerOpen;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
