class CartProductEntity {
  final int id;
  final String name;
  final String image;
  final num price;
  final int quantity;

  CartProductEntity({required this.id, required this.name, required this.image, required this.price, this.quantity = 1});
}