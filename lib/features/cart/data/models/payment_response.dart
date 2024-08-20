//abstract class PaymentDataResponse<T> {}

class PaymentResponseModel {
  PaymentResponseModel({
    required this.status,
    required this.data,
  });

  final String? status;
  final Data? data;

  factory PaymentResponseModel.fromJson(Map<String, dynamic> json) {
    return PaymentResponseModel(
      status: json["status"],
      data: json["data"] == null ? null : Data.fromJson(json["data"]),
    );
  }
}

class Data {
  Data({
    required this.invoiceId,
    required this.invoiceKey,
    required this.paymentData,
  });

  final int? invoiceId;
  final String? invoiceKey;
  final MasterCardPaymentData? paymentData;

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      invoiceId: json["invoice_id"],
      invoiceKey: json["invoice_key"],
      paymentData: json["payment_data"] == null ? null : MasterCardPaymentData.fromJson(json["payment_data"]),
    );
  }
}

class MasterCardPaymentData{
  MasterCardPaymentData({
    required this.redirectTo,
  });

  final String? redirectTo;

  factory MasterCardPaymentData.fromJson(Map<String, dynamic> json) {
    return MasterCardPaymentData(
      redirectTo: json["redirectTo"],
    );
  }
}

// class FawryPaymentData implements PaymentDataResponse {
//   FawryPaymentData({
//     required this.fawryCode,
//     required this.expireDate,
//   });
//
//   final String? fawryCode;
//   final String? expireDate;
//
//   factory FawryPaymentData.fromJson(Map<String, dynamic> json) {
//     return FawryPaymentData(
//       fawryCode: json["fawryCode"],
//       expireDate: json["expireDate"],
//     );
//   }
// }
//
// class MeezaPaymentData implements PaymentDataResponse {
//   MeezaPaymentData({
//     required this.meezaReference,
//   });
//
//   final int? meezaReference;
//
//   factory MeezaPaymentData.fromJson(Map<String, dynamic> json) {
//     return MeezaPaymentData(
//       meezaReference: json["meezaReference"],
//     );
//   }
// }
//
// PaymentDataResponse? buildPay(
//     {required Map<String, dynamic> json, required int paymentMethodId}) {
//   Map<int, PaymentDataResponse> paymentDataResponseMap = {
//     3: FawryPaymentData.fromJson(json),
//     2: MasterCardPaymentData.fromJson(json),
//     4: MeezaPaymentData.fromJson(json),
//   };
//   return paymentDataResponseMap[paymentMethodId];
// }
