import 'package:marketos/features/cart/data/models/payment_methods_model.dart';
import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';

class ToPaymentMethodEntityMapper {
  static PaymentMethodEntity call({required PaymentMethodDetails method}) {
    return PaymentMethodEntity(
      id: method.paymentId,
      name: method.nameEn ?? method.nameAr ?? 'not available',
      image: method.logo ?? '',
    );
  }

  static List<PaymentMethodEntity> callList({required List<PaymentMethodDetails> methods}) {
    return methods.map((method) => call(method: method)).toList();
  }
}