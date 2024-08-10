import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';
import 'package:marketos/features/home/ui/widgets/product_details/image_gallery.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.favorite_border),
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: const [
          ImagesGallery(),
        ],
      ),
    );
  }
}




