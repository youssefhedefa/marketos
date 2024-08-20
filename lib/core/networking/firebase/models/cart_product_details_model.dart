class ProductInCartDetails{
  final int id;
  final int quantity;
  final num price;

  ProductInCartDetails({required this.id, required this.quantity, required this.price});

  factory ProductInCartDetails.fromMap(Map<String, dynamic> map) {
    return ProductInCartDetails(
      id: map['productID'],
      quantity: map['productQuantity'],
      price: map['productPrice'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'productID': id,
      'productQuantity': quantity,
      'productPrice': price,
    };
  }

}