import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/logic/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/get_payment_methods_cubit/get_payment_methods_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/get_payment_methods_cubit/get_payment_methods_state.dart';
import 'package:marketos/features/cart/ui/widgets/item.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.cartProducts, required this.totalPrice});

  final List<CartProductEntity> cartProducts;
  final num totalPrice;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: REdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      child: Column(
        children: [
          Expanded(
            child: ListView.separated(
              itemCount: cartProducts.length,
              padding: EdgeInsets.zero,
              shrinkWrap: true,
              //physics: const NeverScrollableScrollPhysics(),
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
                        arguments: product,
                    ).then((value) {
                      context.read<GetCartCubit>().getCartProducts();
                      return null;
                    });
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
          ),
          SizedBox(height: cartProducts.length <=2 ? cartProducts.length == 1 ? 380.h : 190.h : 20.h),
          Row(
            children: [
              Text(
                'Total Price: ',
                style: AppTextStyleHelper.font26BlackMedium,
              ),
              const Spacer(),
              Text(
                totalPrice.toString(),
                style: AppTextStyleHelper.font26BlackMedium,
              ),
            ],
          ),
          BlocConsumer<GetPaymentMethodsCubit,GetPaymentMethodsState>(
            builder: (context,state) {
              if(state is GetPaymentMethodsLoading){
                return const Center(child: CircularProgressIndicator());
              }
              return CustomButton(
                  onTap: () {
                    context.read<GetPaymentMethodsCubit>().getPaymentMethods();
                  },
                  text: 'Order Now',
                  textStyle: AppTextStyleHelper.font26WhiteBold,
                  color: AppColorHelper.primaryColor,
              );
            },
            listener: (context,state) {
              if(state is GetPaymentMethodsSuccess){
                Navigator.pushNamed(context, AppRoutingConstants.paymentMethods, arguments: state.methods);
              }
            },
          ),
        ],
      ),
    );
  }
}
