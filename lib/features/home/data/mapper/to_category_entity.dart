import 'package:marketos/features/home/data/models/category_model.dart';
import 'package:marketos/features/home/domain/entities/category_entity.dart';

class ToCategoryEntityMapper {
  static CategoryEntity call({required CategoryModel model}) {
    return CategoryEntity(
      category: model.name,
      ref: model.slug,
    );
  }
  static List<CategoryEntity> listCall({required List<CategoryModel> models}) {
    return models.map((model) => call(model: model)).toList();
  }
}
