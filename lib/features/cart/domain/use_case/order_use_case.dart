import 'package:dartz/dartz.dart';
import 'package:marketos/core/failure/failure.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/data/models/payment_response.dart';
import 'package:marketos/features/cart/domain/repo/cart_repo.dart';

class OrderUseCase{
  final CartRepo repo;

  OrderUseCase({required this.repo});

  Future<Either<Failure, PaymentResponseModel>> call({required PaymentRequestModel request}) async {
    return await repo.order(request: request);
  }

}