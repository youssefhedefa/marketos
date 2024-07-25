class UserModel{
  final String id;
  final String email;
  final String name;
  final String password;
  final String imageUrl;
  final List<String> cart;
  final List<String> favourites;
  final dynamic address;

  UserModel( {required this.id, required this.email, required this.name, required this.password,required this.imageUrl,required this.cart,required this.favourites, required this.address});

  factory UserModel.fromJson(Map<String, dynamic> json){
    return UserModel(
      id: json['id'],
      email: json['email'],
      name: json['name'],
      password: json['password'],
      imageUrl: json['imageUrl'],
      cart: json['cart'],
      favourites: json['favourites'],
      address: json['address']

    );
  }

  Map<String, dynamic> toJson(){
    return {
      'id': id,
      'email': email,
      'name': name,
      'password': password,
      'imageUrl': imageUrl,
      'cart': cart,
      'favourites': favourites,
      'address': address
    };
  }
}