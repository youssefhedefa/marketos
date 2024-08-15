import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';

class PaymentMethodsModel {
  PaymentMethodsModel({
    required this.status,
    required this.data,
  });

  final String? status;
  final List<PaymentMethodDetails> data;

  factory PaymentMethodsModel.fromJson(Map<String, dynamic> json){
    return PaymentMethodsModel(
      status: json["status"],
      data: json["data"] == null ? [] : List<PaymentMethodDetails>.from(json["data"]!.map((x) => PaymentMethodDetails.fromJson(x))),
    );
  }

}

class PaymentMethodDetails extends PaymentMethodEntity {
  PaymentMethodDetails({
    required this.paymentId,
    required this.nameEn,
    required this.nameAr,
    required this.redirect,
    required this.logo,
  }) : super(id: paymentId, name: nameEn ?? 'Not Found', image: logo ?? '');

  final int paymentId;
  final String? nameEn;
  final String? nameAr;
  final String? redirect;
  final String? logo;

  factory PaymentMethodDetails.fromJson(Map<String, dynamic> json){
    return PaymentMethodDetails(
      paymentId: json["paymentId"],
      nameEn: json["name_en"],
      nameAr: json["name_ar"],
      redirect: json["redirect"],
      logo: json["logo"],
    );
  }

}
