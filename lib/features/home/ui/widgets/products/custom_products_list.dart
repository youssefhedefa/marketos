import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/functions/calculate_height.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_states.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_product_item.dart';

class CustomProductsList extends StatelessWidget {
  const CustomProductsList({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductByCategoryCubit,GetProductsByCategoryState>(
      builder: (context,state) {
        if (state is GetProductsByCategorySuccessState) {
          return SizedBox(
            height: calculateHeight(isDrawerOpened: isDrawerOpen, heightWhenDrawerOpened: 260.h, heightWhenDrawerClosed: 360.h),
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => ProductItem(
                isDrawerOpen: isDrawerOpen,
                productImage: state.products[index].image,
                productName: state.products[index].name,
                productPrice: state.products[index].productPrice,
              ),
              separatorBuilder: (context, index) => SizedBox(
                width: 30.w,
              ),
              itemCount: state.products.length,
            ),
          );
        }
        else if (state is GetProductsByCategoryErrorState) {
          return Center(
            child: Text(state.message),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
    );
  }
}

