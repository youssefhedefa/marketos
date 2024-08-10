import 'package:flutter/material.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class ProductInformation extends StatelessWidget {
  const ProductInformation({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(24),
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(24),
            topRight: Radius.circular(24),
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Product Name',
                style: AppTextStyleHelper.font36BlackBold,
              ),
              const SizedBox(height: 20),
              Text(
                'Product Description Product Description Product Description Product Description',
                style: AppTextStyleHelper.font22DarkGreyBold,
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'total ',
                    style: AppTextStyleHelper.font30BlackMedium,
                  ),
                  const Spacer(),
                  Text(
                    '\$100',
                    style: AppTextStyleHelper.font26PurpleBold,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {},
                text: 'Add to Basket',
                textStyle: AppTextStyleHelper.font26WhiteBold,
                color: AppColorHelper.primaryColor,
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
