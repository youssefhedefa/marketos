import 'package:flutter/material.dart';
import 'package:marketos/features/cart/ui/widgets/list_of_items.dart';

class CartView extends StatelessWidget {
  const CartView({super.key});

  @override
  Widget build(BuildContext context) {
   // return const EmptyCart();
    return const ListOfItems();
  }
}


