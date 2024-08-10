import 'package:flutter/material.dart';
import 'package:marketos/features/home/ui/widgets/product_details/main_image.dart';
import 'package:marketos/features/home/ui/widgets/product_details/other_images_row.dart';

class ImagesGallery extends StatefulWidget {
  const ImagesGallery({super.key, required this.mainImage, required this.otherImages});

  final String mainImage;
  final List<String> otherImages;

  @override
  State<ImagesGallery> createState() => _ImagesGalleryState();
}

class _ImagesGalleryState extends State<ImagesGallery> {

  late String mainImage;

  @override
  void initState() {
    mainImage = widget.mainImage;
    //changeMainImage(widget.mainImage);
    super.initState();
  }

  void changeMainImage(String newImage){
    setState(() {
      mainImage = newImage;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(18),
      child: Column(
        children: [
          MainImage(
            image: mainImage,
          ),
          const SizedBox(
            height: 16,
          ),
          OtherProductImages(
            images: [widget.mainImage,...widget.otherImages],
            changeMainImage: changeMainImage,
          ),
        ],
      ),
    );
  }
}