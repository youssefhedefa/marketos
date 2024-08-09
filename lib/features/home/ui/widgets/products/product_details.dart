import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class ProductDetails extends StatelessWidget {
  const ProductDetails({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Product Name',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: isDrawerOpen ? AppTextStyleHelper.font22BlackBold : AppTextStyleHelper.font26BlackBold,
        ),
        Text(
          'Product Price \$',
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style:  isDrawerOpen ? AppTextStyleHelper.font22PurpleBold : AppTextStyleHelper.font26PurpleBold,
        ),
      ],
    );
  }
}
