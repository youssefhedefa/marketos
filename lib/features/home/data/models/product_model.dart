class ProductModel {
  final List<ProductData> products;

  ProductModel({required this.products});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      products: json["products"] == null
          ? []
          : List<ProductData>.from(
              json["products"]!.map((x) => ProductData.fromJson(x))),
    );
  }
}

class ProductData {
  final int id;
  final String title;
  final String description;
  final num price;
  final List<String> images;
  final String thumbnail;
  final String category;

  ProductData({
    required this.id,
    required this.title,
    required this.description,
    required this.price,
    required this.images,
    required this.thumbnail,
    required this.category,
  });

  factory ProductData.fromJson(Map<String, dynamic> json) {
    return ProductData(
      id: json['id'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      images: List<String>.from(json['images']),
      thumbnail: json['thumbnail'],
      category: json['category'],
    );
  }
}
