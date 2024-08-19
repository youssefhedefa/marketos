import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/logic/cubits/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:marketos/features/home/ui/widgets/product_details/image_gallery.dart';
import 'package:marketos/features/home/ui/widgets/product_details/product_information.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final HomeProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.darkWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          IconButton(
            onPressed: () {
              print('object');
              context.read<AddToFavoriteCubit>().addToFavorite(
                    product: ProductInCartDetails(
                      id: product.productID,
                      quantity: 1,
                      price: product.productPrice,
                    ),
                  );
            },
            icon: SizedBox(
                width: 40,
                height: 40,
                child: const Icon(Icons.favorite_border)),
          ),
        ],
        backgroundColor: AppColorHelper.darkWhiteColor,
        surfaceTintColor: AppColorHelper.darkWhiteColor,
      ),
      body: Column(
        children: [
          ImagesGallery(
            mainImage: product.image,
            otherImages: product.otherImages,
          ),
          ProductInformation(
            id: product.productID,
            name: product.name,
            description: product.productDescription,
            price: product.productPrice,
          ),
        ],
      ),
    );
  }
}
