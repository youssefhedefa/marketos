import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/ui/widgets/item.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.cartProducts});

  final List<CartProductEntity> cartProducts;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        itemCount: cartProducts.length,
        padding: REdgeInsets.symmetric(horizontal: 20.w,vertical: 10.h),
        itemBuilder: (context, index) {
          return Item(
            productName: cartProducts[index].name,
            productPrice: cartProducts[index].price.toString(),
            image: cartProducts[index].image,
            quantity: cartProducts[index].quantity,
          );
        },
        separatorBuilder: (context, index) {
          return const SizedBox(height: 20);
        },
      ),
    );
  }
}

