import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';

class Item extends StatelessWidget {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        children: [
          Image.asset(AppImageHelper.testProductImage),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Product Name',
                style: AppTextStyleHelper.font26BlackMedium,
              ),
              Text(
                '\$100',
                style: AppTextStyleHelper.font22PurpleBold,
              ),
            ],
          ),
        ],
      ),
    );
  }
}