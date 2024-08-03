import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/functions/calculate_hight.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';

class CustomProductsList extends StatelessWidget {
  const CustomProductsList({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: calculateHeight(isDrawerOpened: isDrawerOpen, heightWhenDrawerOpened: 260.h, heightWhenDrawerClosed: 360.h),
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => ProductItem(
          isDrawerOpen: isDrawerOpen,
        ),
        separatorBuilder: (context, index) => SizedBox(
          width: 30.w,
        ),
        itemCount: 10,
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({super.key,required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: isDrawerOpen ? 50 : 100,),
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Positioned(
              child: Container(
                clipBehavior: Clip.none,
                width: isDrawerOpen ? 140.w : 200.w,
                height: isDrawerOpen ? 160.h : 200.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Positioned(
              bottom: isDrawerOpen ? 110.h : 120.h,
              child: Container(
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
              ),
            ),
          ],
        ),
      ],
    );
  }
}
