import 'package:bloc/bloc.dart';
import 'package:marketos/features/cart/domain/entities/cart_product_entity.dart';
import 'package:marketos/features/cart/logic/cubits/order_now_cubit/order_now_state.dart';

class OrderNowCubit extends Cubit<OrderNowState> {
  OrderNowCubit() : super(OrderNowInitial());



}