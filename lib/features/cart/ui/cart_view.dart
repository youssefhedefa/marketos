import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';
import 'package:marketos/features/cart/logic/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/get_cart_cubit/get_cart_states.dart';
import 'package:marketos/core/components/empty_screen.dart';
import 'package:marketos/features/cart/ui/widgets/list_of_items.dart';

class CartView extends StatefulWidget {
  const CartView({super.key, required this.isDrawerOpened});

  final bool isDrawerOpened;

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  @override
  void initState() {
    super.initState();
    context.read<GetCartCubit>().getCartProducts();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCartCubit, GetCartState>(
      bloc: context.read<GetCartCubit>()..getCartProducts(),
      builder: (context, state) {
        if (state is GetCartLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is GetCartSuccess) {
          if (state.cart.cartProducts.isEmpty) {
            return const Center(
              child: EmptyScreen(
                image: AppImageHelper.emptyCartImage,
                text: 'cart',
              ),
            );
          } else {
            return ListOfItems(
              cartProducts: state.cart.cartProducts,
              totalPrice: state.cart.totalPrice,
              isDrawerOpened: widget.isDrawerOpened,
            );
          }
        } else if (state is GetCartError) {
          return Center(child: Text(state.message));
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
