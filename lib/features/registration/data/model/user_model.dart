class UserModel{
  final String id;
  final String email;
  final String name;
  final String imageUrl;
  final List<dynamic> cart;
  final List<dynamic> favourites;
  final dynamic address;

  UserModel( {required this.id, required this.email, required this.name, required this.imageUrl,required this.cart,required this.favourites, required this.address});

  factory UserModel.fromMap(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      cart: json['cart'],
      favourites: json['favourites'],
      address: json['address']

    );
  }

  Map<String, dynamic> toMap(){
    return {
      'id': id,
      'email': email,
      'name': name,
      'imageUrl': imageUrl,
      'cart': cart,
      'favourites': favourites,
      'address': address
    };
  }
}