class HomeProductEntity{
  final int productID;
  final String name;
  final num productPrice;
  final String image;
  final List<String> otherImages;
  final String productCategory;
  final String productDescription;

  HomeProductEntity({
    required this.productID,
    required this.name,
    required this.productPrice,
    required this.image,
    required this.productCategory,
    required this.otherImages,
    required this.productDescription,
  });
}