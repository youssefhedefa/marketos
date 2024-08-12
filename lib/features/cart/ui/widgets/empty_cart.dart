import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';

class EmptyCart extends StatelessWidget {
  const EmptyCart({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffF5F4F9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImageHelper.emptyCartImage,
              width: 350,
              height: 350,
            ),
            Text(
              'No items in your cart yet!',
              style: AppTextStyleHelper.font32BlackBold,
            ),
          ],
        ),
      ),
    );
  }
}
