import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/ui/widgets/item.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.cartProducts});

  final List<CartProductEntity> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          ListView.separated(
            itemCount: cartProducts.length,
            padding: EdgeInsets.zero,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  HomeProductEntity product = HomeProductEntity(
                    productID: cartProducts[index].id,
                    name: cartProducts[index].name,
                    productPrice: cartProducts[index].price,
                    image: cartProducts[index].image,
                    otherImages: cartProducts[index].images,
                    productDescription: cartProducts[index].description,
                    productCategory: '',
                  );

                  Navigator.pushNamed(
                      context, AppRoutingConstants.productDetails,
                      arguments: product);
                },
                child: Item(
                  productName: cartProducts[index].name,
                  productPrice: cartProducts[index].price.toString(),
                  image: cartProducts[index].image,
                  quantity: cartProducts[index].quantity,
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(height: 20);
            },
          ),
          SizedBox(height: cartProducts.length <=2 ? 190.h : 20.h),
          CustomButton(
              onTap: () {},
              text: 'Order Now',
              textStyle: AppTextStyleHelper.font26WhiteBold,
              color: AppColorHelper.primaryColor,
          ),
        ],
      ),
    );
  }
}
