import 'package:flutter/material.dart';
import 'package:marketos/features/home/ui/widgets/product_details/other_image_item.dart';


class OtherProductImages extends StatelessWidget {
  const OtherProductImages({super.key, required this.images});

  final List<String> images;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: ((MediaQuery.sizeOf(context).width - 100) / 4),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (_,index) =>  GestureDetector(
              onTap: () {
                // context.read<ProductCubit>().changeMainImageIndex(index : index);
                // print('index: $index');
              },
              child: OtherImageItem(
                imageUrl: images[index],
              ),
            ),
            separatorBuilder:  (_,index) => const SizedBox(width: 12,),
            itemCount: images.length,
          ),
        ),
      ),
    );
  }
}
