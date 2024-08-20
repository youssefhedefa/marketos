import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

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
