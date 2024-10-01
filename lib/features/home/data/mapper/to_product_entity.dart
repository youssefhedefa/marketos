import 'package:marketos/features/home/data/models/product_model.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';

class ToProductEntityMapper{
  static HomeProductEntity call({required ProductData data}){
    return HomeProductEntity(
      productID: data.id,
      name: data.title,
      productPrice: data.price,
      image: data.thumbnail,
      productCategory: data.category,
      otherImages: data.images,
      productDescription: data.description,
    );
  }

  static List<HomeProductEntity> listCall({required List<ProductData> data}){
    return data.map((model) => call(data: model)).toList();
  }

}