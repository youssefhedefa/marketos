import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/cart/data/models/payment_request.dart';
import 'package:marketos/features/cart/domain/entities/invoice_entity.dart';
import 'package:marketos/features/cart/logic/cubits/order_cubit/order_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/order_cubit/order_states.dart';

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
          },
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: invoice.methods.length,
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.name, required this.imageUrl, this.onTap});

  final String name;
  final String imageUrl;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: REdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey),
        ),
        child: Row(
          children: [
            Image.network(
              imageUrl,
              width: 120.w,
              height: 70.h,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                name,
                style: AppTextStyleHelper.font22BlackBold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

