import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.isDrawerOpen, required this.productPrice, required this.productName});

  final bool isDrawerOpen;
  final num productPrice;
  final String productName;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          productName,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: isDrawerOpen ? AppTextStyleHelper.font22BlackBold : AppTextStyleHelper.font26BlackBold,
        ),
        Text(
          '$productPrice \$',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:  isDrawerOpen ? AppTextStyleHelper.font22PurpleBold : AppTextStyleHelper.font26PurpleBold,
        ),
      ],
    );
  }
}
