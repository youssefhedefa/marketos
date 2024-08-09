import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';



class ProductImage extends StatelessWidget {
  const ProductImage({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: isDrawerOpen ? 80.w : 150.w,
      height: isDrawerOpen ? 100.h : 150.h,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        image: DecorationImage(
          image: AssetImage(
            AppImageHelper.testProductImage,
          ),
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
