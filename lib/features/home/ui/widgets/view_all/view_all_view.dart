import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/data/models/view_all_model.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_product_item.dart';

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key,required this.viewAllModel,});

  final ViewAllModel viewAllModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.darkWhiteColor,
      appBar: AppBar(
        title: Text(
            viewAllModel.categoryName,
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
                itemCount: viewAllModel.products.length,
                mainAxisSpacing: 16.h,
                crossAxisSpacing: 40.w,
                itemBuilder: (BuildContext context, int index) {
                  if (index == 1) {
                    return Padding(
                      padding: EdgeInsets.only(top: 90.0.h),
                      child: GestureDetector(
                        onTap: () {},
                        child: ProductItem(
                          isDrawerOpen: false,
                          productName: viewAllModel.products[index].name,
                          productPrice: viewAllModel.products[index].productPrice,
                          productImage:
                          viewAllModel.products[index].image,
                        ),
                      ),
                    );
                  }
                  return GestureDetector(
                    onTap: () {},
                    child: ProductItem(
                      isDrawerOpen: false,
                      productName: viewAllModel.products[index].name,
                      productPrice: viewAllModel.products[index].productPrice,
                      productImage:
                      viewAllModel.products[index].image,
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
