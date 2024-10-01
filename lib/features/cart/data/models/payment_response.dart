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
