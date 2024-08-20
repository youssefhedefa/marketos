import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/ui/widgets/categories/custom_categories_list.dart';
import 'package:marketos/features/home/ui/widgets/products/custom_products_list.dart';
import 'package:marketos/features/home/ui/widgets/view_all/view_all_custom_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Order Online\ncollect in store',
          style: isDrawerOpen
              ? AppTextStyleHelper.font36BlackBold
              : AppTextStyleHelper.font46BlackBold,
        ),
        SizedBox(height: isDrawerOpen ? 10.h : 20.h),
        const CustomCategoriesList(),
        SizedBox(height: isDrawerOpen ? 10.h : 20.h),
        CustomProductsList(
          isDrawerOpen: isDrawerOpen,
        ),
        ViewAllCustomTextButton(
          isDrawerOpen: isDrawerOpen,
        ),
      ],
    );
  }
}
