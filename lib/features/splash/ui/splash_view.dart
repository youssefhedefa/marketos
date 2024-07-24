import 'package:flutter/material.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

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
                image: AssetImage('assets/images/splash.png'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 36.0, vertical: 90),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Text(
                  'Find Your Gadget',
                  textAlign: TextAlign.center,
                  style: AppFontStyleHelper.font62WhiteExtraBold,
                ),
                Spacer(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
