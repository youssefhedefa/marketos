import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/home/data/models/view_all_model.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_product_item.dart';

class ViewAllBody extends StatelessWidget {
  const ViewAllBody({super.key, required this.viewAllModel});

  final ViewAllModel viewAllModel;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 18),
      child: MasonryGridView.builder(
        gridDelegate:
        const SliverSimpleGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
        ),
        itemCount: viewAllModel.products.length,
        mainAxisSpacing: 16.h,
        crossAxisSpacing: 40.w,
        itemBuilder: (BuildContext context, int index) {
          if (index == 1) {
            return Padding(
              padding: EdgeInsets.only(top: 90.0.h),
              child: GestureDetector(
                onTap: () {
                  onProductTap(context: context, index: index);
                },
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
            onTap: () {
              onProductTap(context: context, index: index);
            },
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
    );
  }

  onProductTap({required BuildContext context,required int index}) {

    HomeProductEntity product = HomeProductEntity(
      productID: viewAllModel.products[index].productID,
      name: viewAllModel.products[index].name,
      productPrice: viewAllModel.products[index].productPrice,
      image: viewAllModel.products[index].image,
      otherImages: viewAllModel.products[index].otherImages,
      productDescription: viewAllModel.products[index].productDescription,
      productCategory: '',
    );
    Navigator.pushNamed(
      context,
      AppRoutingConstants.productDetails,
      arguments: product,
    );
  }

}
