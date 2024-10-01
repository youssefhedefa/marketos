import 'package:flutter/material.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(AppImageHelper.splashImage),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 38.0, vertical: 86),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Find Your Gadget',
                  textAlign: TextAlign.center,
                  style: AppTextStyleHelper.font62WhiteExtraBold,
                ),
                const Spacer(),
                CustomButton(
                  onTap: () {
                    Navigator.pushNamed(context, AppRoutingConstants.signIn);
                  },
                  text: 'Get Started',
                  textStyle: AppTextStyleHelper.font28PurpleBold,
                  color: AppColorHelper.whiteColor,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
