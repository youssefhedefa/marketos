import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.title, required this.icon});

  final String title;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(26.0),
      child: Row(
        children: [
          Icon(
              icon,
            color: AppColorHelper.whiteColor,
            size: 34,
          ),
          const SizedBox(width: 18,),
          Text(
              title,
            style: AppTextStyleHelper.font26WhiteBold,
          ),
        ],
      ),
    );
  }
}
