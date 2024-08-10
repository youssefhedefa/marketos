import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: 210.h,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(26.r),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(height: 46.h),
                Text(
                  'John Doe',
                  style: AppTextStyleHelper.font32BlackBold,
                ),
                Text(
                  'Email',
                  style: AppTextStyleHelper.font22BlackMedium,
                ),
                Text(
                  'Address',
                  style: AppTextStyleHelper.font22BlackMedium,
                ),
              ],
            ),
          ),
          Positioned(
            top: 0,
            child: CircleAvatar(
              radius: 56.r,
              backgroundColor: Colors.white,
              child:
              Image.network('https://avatar.iran.liara.run/public/25'),
            ),
          ),
        ],
      ),
    );
  }
}
