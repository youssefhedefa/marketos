import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/domain/entities/invoice_entity.dart';
import 'package:marketos/features/cart/logic/cubits/order_cubit/order_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/order_cubit/order_states.dart';
import 'package:marketos/features/cart/ui/widgets/payment_method.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key,  required this.invoice});

  //final List<PaymentMethodEntity> methods;
  final InvoiceEntity invoice;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(24.h),
        itemBuilder: (context, index) => PaymentMethod(
          name: invoice.methods[index].name,
          imageUrl: invoice.methods[index].image,
          onTap: (){
            onPaymentMethodTap(context: context,index:  index);
          },
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: invoice.methods.length,
      ),
    );
  }

  onPaymentMethodTap({required BuildContext context,required int index}) {
    context.read<OrderCubit>()
        .makeOrder(
      orderRequestModel: PaymentRequestModel(
        paymentMethodId: invoice.methods[index].id,
        cartTotal: invoice.totalPrice.toString(),
        customer: Customer(
          firstName: invoice.user.name,
          email: invoice.user.email,
          address:invoice.user.address,
          lastName: '.',
          phone: '01000000000',
        ),
        cartItems: invoice.products,
      ),
    );
    context.read<OrderCubit>().stream.listen((state) {
      if (state is OrderSuccess) {
        Navigator.pushNamed(context, AppRoutingConstants.masterCardView, arguments: state.response.data!.paymentData!.redirectTo,);
      }
    });
  }

}


