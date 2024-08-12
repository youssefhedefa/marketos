import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

class EditProfileOption extends StatelessWidget {
  const EditProfileOption({super.key, required this.title, this.onTap, required this.isDrawerOpened});

  final String title;
  final void Function()? onTap;
  final bool isDrawerOpened;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: isDrawerOpened ? 12 : 24, vertical: isDrawerOpened ? 10 : 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(26),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: isDrawerOpened ? AppTextStyleHelper.font22BlackBold : AppTextStyleHelper.font32BlackBold,
            ),
            const Spacer(),
            const Icon(
              Icons.arrow_forward_ios,
              color: Colors.black,
            ),
          ],
        ),
      ),
    );
  }
}
