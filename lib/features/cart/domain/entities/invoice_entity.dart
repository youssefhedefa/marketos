import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';
import 'package:marketos/features/registration/data/model/user_model.dart';

class InvoiceEntity{
  final List<PaymentMethodEntity> methods;
  final List<CartItem> products;
  final num totalPrice;
  final UserModel user;

  InvoiceEntity({required this.products, required this.totalPrice, required this.user, required this.methods});

}