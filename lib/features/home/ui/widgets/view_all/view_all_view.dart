import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_product_item.dart';

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.darkWhiteColor,
      appBar: AppBar(
        title: Text(
            'Category Name',
          style: AppTextStyleHelper.font36BlackBold,
        ),
        backgroundColor: AppColorHelper.darkWhiteColor,
        surfaceTintColor: AppColorHelper.darkWhiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: Padding(
              padding: REdgeInsets.symmetric(horizontal: 18),
              child: MasonryGridView.builder(
                gridDelegate:
                    const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2),
                itemCount: 10,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 40.w,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 1) {
                    return Padding(
                      padding: EdgeInsets.only(top: 90.0.h),
                      child: GestureDetector(
                        onTap: () {},
                        child: const ProductItem(
                          isDrawerOpen: false,
                          productName: 'Product Name',
                          productPrice: 20,
                          productImage:
                              'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {},
                    child: const ProductItem(
                      isDrawerOpen: false,
                      productName: 'Product Name',
                      productPrice: 20,
                      productImage:
                          'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
                    ),
                  );
                },
              ),
            ),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
