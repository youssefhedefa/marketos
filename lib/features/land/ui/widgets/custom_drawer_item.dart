import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class CustomDrawerItem extends StatelessWidget {
  const CustomDrawerItem({super.key, required this.title, required this.icon, this.onTap});

  final String title;
  final IconData icon;
  final void Function()? onTap;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
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
      ),
    );
  }
}
