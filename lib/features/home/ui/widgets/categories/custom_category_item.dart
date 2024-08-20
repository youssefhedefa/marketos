import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class CustomCategoryItem extends StatelessWidget {
  const CustomCategoryItem({super.key, required this.categoryName, required this.isSelected});

  final String categoryName;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          categoryName,
          style: isSelected ? AppTextStyleHelper.font26PurpleBold : AppTextStyleHelper.font26DarkGreyBold,
        ),
        SizedBox(
          height: 6.h,
        ),
        isSelected ? SizedBox(
          width: categoryName.length * 14.w,
          child: const Divider(
            color: AppColorHelper.primaryColor,
            thickness: 2,
            height: 2,
            endIndent: 10,
            indent: 10,
          ),
        ) : const SizedBox(),
      ],
    );
  }
}
