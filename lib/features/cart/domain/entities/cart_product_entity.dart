class CartOrFavoriteProductEntity {
  final int id;
  final String name;
  final String image;
  final num price;
  final int quantity;
  final List<String> images;
  final String description;

  CartOrFavoriteProductEntity({required this.id, required this.name, required this.image, required this.price, this.quantity = 1,required this.images,required this.description});
}