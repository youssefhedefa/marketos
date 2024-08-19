class PaymentRequestModel {
  final int paymentMethodId;
  final String cartTotal;
  final String currency = 'USD';
  final Customer customer;
  final RedirectionUrls redirectionUrls = RedirectionUrls(
      successUrl: 'https://dev.fawaterk.com/success',
      failUrl: 'https://dev.fawaterk.com/fail',
      pendingUrl: 'https://dev.fawaterk.com/pending',
  );
  final List<CartItem> cartItems;

  PaymentRequestModel({required this.paymentMethodId, required this.cartTotal, required this.customer, required this.cartItems});

  Map<String, dynamic> toJson() {
    return {
      'payment_method_id': paymentMethodId,
      'cartTotal': cartTotal,
      'currency': currency,
      'customer': customer.toJson(),
      'redirectionUrls': redirectionUrls.toJson(),
      'cartItems': cartItems.map((e) => e.toJson()).toList(),
    };
  }


}

class Customer{
  final String firstName;
  final String lastName;
  final String email;
  final String phone;
  final String address;

  Customer({required this.firstName, required this.lastName, required this.email, required this.phone, required this.address});

  Map<String, dynamic> toJson() {
    return {
      'first_name': firstName,
      'last_name': lastName,
      'email': email,
      'phone': phone,
      'address': address,
    };
  }

}

class RedirectionUrls{
  final String successUrl;
  final String failUrl;
  final String pendingUrl;

  RedirectionUrls({required this.successUrl, required this.failUrl, required this.pendingUrl});

  Map<String, dynamic> toJson() {
    return {
      'successUrl': successUrl,
      'failUrl': failUrl,
      'pendingUrl': pendingUrl,
    };
  }
}

class CartItem{
  final String name;
  final String price;
  final String quantity;

  CartItem({required this.name, required this.price, required this.quantity});

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'price': price,
      'quantity': quantity,
    };
  }
}