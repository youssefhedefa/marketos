import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/functions/calculate_height.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_product_item.dart';

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

