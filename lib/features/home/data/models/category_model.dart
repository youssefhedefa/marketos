class CategoryModel {
  final String name;
  final String ref;

  CategoryModel({required this.name, required this.ref});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'],
      ref: json['slug'],
    );
  }
}