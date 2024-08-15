import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/cart/domain/entities/payment_method_entity.dart';

class PaymentMethodsView extends StatelessWidget {
  const PaymentMethodsView({super.key, required this.methods});

  final List<PaymentMethodEntity> methods;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColorHelper.whiteColor,
        surfaceTintColor: AppColorHelper.whiteColor,
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(24.h),
        itemBuilder: (context, index) => PaymentMethod(
          name: methods[index].name,
          imageUrl: methods[index].image,
        ),
        separatorBuilder: (context, index) => SizedBox(height: 12.h),
        itemCount: methods.length,
      ),
    );
  }
}

class PaymentMethod extends StatelessWidget {
  const PaymentMethod({super.key, required this.name, required this.imageUrl});

  final String name;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
