import 'package:marketos/core/networking/firebase/models/user_cart_model.dart';

class UserModel{
  final String id;
  final String email;
  final String name;
  final String imageUrl;
  final List<dynamic> cart;
  final List<dynamic> favourites;
  final dynamic address;
  final UserCart userCart;

  UserModel( {required this.id, required this.email, required this.name, required this.imageUrl,required this.cart,required this.favourites, required this.address,required this.userCart});

  factory UserModel.fromMap(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      imageUrl: json['imageUrl'],
      cart: json['cart'],
      favourites: json['favourites'],
      address: json['address'],
      userCart: UserCart.fromMap(json['userCart'])
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
      'address': address,
      'userCart': userCart.toMap()
    };
  }
}