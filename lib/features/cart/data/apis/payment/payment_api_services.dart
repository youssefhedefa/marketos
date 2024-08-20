import 'package:dio/dio.dart';
import 'package:marketos/features/cart/data/apis/api_constants.dart';
import 'package:marketos/features/cart/data/models/payment_methods_model.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/data/models/payment_response.dart';
import 'package:retrofit/retrofit.dart';
part 'payment_api_services.g.dart';

@RestApi(baseUrl: CartApiConstants.paymentBaseUrl)
abstract class PaymentApiService {
  factory PaymentApiService(Dio dio) = _PaymentApiService;

  @GET(CartApiConstants.paymentMethods)
  Future<PaymentMethodsModel> getPaymentMethods({
    @Header("Authorization") String token = 'Bearer d83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd',
    @Header("Content-Type") String type = 'application/json',
  });


  @POST(CartApiConstants.paymentRequest)
  Future<PaymentResponseModel> requestPayment({
    @Header("Authorization") String token = 'Bearer d83a5d07aaeb8442dcbe259e6dae80a3f2e21a3a581e1a5acd',
    @Header("Content-Type") String type = 'application/json',
    @Body() required PaymentRequestModel paymentRequest,
  });

}
