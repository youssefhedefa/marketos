import 'package:flutter/material.dart';
import 'package:marketos/features/home/ui/widgets/product_details/main_image.dart';
import 'package:marketos/features/home/ui/widgets/product_details/other_images_row.dart';


class ImagesGallery extends StatelessWidget {
  const ImagesGallery({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        MainImage(
          image: 'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
        ),
        SizedBox(
          height: 16,
        ),
        OtherProductImages(
          images: [
            'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
            'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
            'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
            'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
            'https://cdn.dummyjson.com/products/images/home-decoration/Decoration%20Swing/thumbnail.png',
          ],
        ),
      ],
    );
  }
}
