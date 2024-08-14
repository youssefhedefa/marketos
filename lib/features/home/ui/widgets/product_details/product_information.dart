import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/logic/cubits/add_to_cart_cubit/add_to_cart_cubit.dart';
import 'package:marketos/features/home/logic/cubits/add_to_cart_cubit/add_to_cart_states.dart';
import 'package:marketos/features/home/logic/cubits/check_product_cubit/check_product_cubit.dart';
import 'package:marketos/features/home/logic/cubits/check_product_cubit/check_product_states.dart';


class ProductInformation extends StatelessWidget {
  const ProductInformation({super.key, required this.id, required this.name, required this.description, required this.price});

  final int id;
  final String name;
  final String description;
  final num price;

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
                name,
                style: AppTextStyleHelper.font36BlackBold,
              ),
              const SizedBox(height: 20),
              Text(
                description,
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
                    '\$$price',
                    style: AppTextStyleHelper.font26PurpleBold,
                  ),
                ],
              ),
              const SizedBox(height: 20),
              BlocBuilder<CheckProductCubit,CheckProductState>(
                builder: (context,checkProductState) {
                  if (checkProductState is CheckProductErrorState) {
                    return Text(checkProductState.message);
                  }
                  if (checkProductState is CheckProductSuccessState) {
                    return BlocConsumer<AddToCartCubit,AddToCartState>(
                      builder: (context,state) {
                        return CustomButton(
                          onTap: () {
                            if(checkProductState.isProductInCart){
                              print('object');
                            }
                            else {
                              context.read<AddToCartCubit>().addToCart(productId: id);
                            }
                          },
                          text: checkProductState.isProductInCart ? 'Remove from Cart' : 'Add to Cart',
                          textStyle: AppTextStyleHelper.font26WhiteBold,
                          color: AppColorHelper.primaryColor,
                        );
                      },
                      listener: (context,state) {
                        if (state is AddToCartSuccessState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Product added to cart'),
                            ),
                          );
                          context.read<CheckProductCubit>().checkProduct(productId: id);
                        }
                        if (state is AddToCartErrorState) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(state.message),
                              backgroundColor: Colors.red,
                            ),
                          );
                        }
                      },
                    );
                  }
                  return const Center(child: CircularProgressIndicator());
                }
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
