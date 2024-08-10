import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class ViewAllCustomTextButton extends StatelessWidget {
  const ViewAllCustomTextButton({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            'View All',
            style: isDrawerOpen
                ? AppTextStyleHelper.font26PurpleBold
                : AppTextStyleHelper.font22PurpleBold,
          ),
          const SizedBox(width: 8),
          Icon(
            Icons.arrow_forward,
            color: AppColorHelper.primaryColor,
            size: isDrawerOpen ? 20 : 24,)
        ],
      ),
    );
  }
}
