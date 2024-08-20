import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';


class MainImage extends StatelessWidget {
  const MainImage({super.key, required this.image});

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.sizeOf(context).height * 0.235,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
      ),
      child: returnImage(),
    );
  }
  Widget returnImage(){
    if(image.isNotEmpty){
      return ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.network(
          image,
          fit: BoxFit.fill,
        ),
      );
    } else {
      return Image.asset(
        AppImageHelper.testProductImage,
        fit: BoxFit.fill,
      );
    }
  }
}
