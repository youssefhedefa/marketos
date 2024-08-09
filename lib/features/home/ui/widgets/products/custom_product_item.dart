import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_product_image.dart';
import 'package:marketos/features/home/ui/widgets/products/product_details.dart';


class ProductItem extends StatelessWidget {
  const ProductItem({super.key,required this.isDrawerOpen, required this.productPrice, required this.productName, required this.productImage});

  final bool isDrawerOpen;
  final num productPrice;
  final String productName;
  final String productImage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: isDrawerOpen ? 50 : 100,),
        Stack(
          alignment: Alignment.topCenter,
          clipBehavior: Clip.none,
          children: [
            Container(
              padding: REdgeInsets.only(top: isDrawerOpen ? 80 : 100,right: 8,left: 8),
              clipBehavior: Clip.none,
              width: isDrawerOpen ? 140.w : 200.w,
              height: isDrawerOpen ? 160.h : 200.h,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: ProductDetails(
                isDrawerOpen: isDrawerOpen,
                productPrice: productPrice,
                productName: productName,
              ),
            ),
            Positioned(
              bottom: isDrawerOpen ? 110.h : 120.h,
              child: ProductImage(
                isDrawerOpen : isDrawerOpen,
                productImage: productImage,
              ),
            ),
          ],
        ),
      ],
    );
  }
}