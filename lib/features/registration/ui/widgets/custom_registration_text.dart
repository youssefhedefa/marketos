import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

class CustomRegistrationText extends StatelessWidget {
  const CustomRegistrationText({super.key, required this.text, required this.onTap});

  final String text;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Text(
          text,
          style: AppTextStyleHelper.font26PurpleBold,
        ),
      ),
    );
  }
}
