import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
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
        actions: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.favorite_border),
            ),
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