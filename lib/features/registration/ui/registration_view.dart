import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';


class RegistrationView extends StatelessWidget {
  const RegistrationView({super.key, required this.registrationForm, required this.title});

  final Widget registrationForm;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 90,
              left: 38,
              bottom: 40,
            ),
            child: Text(
              title,
              style: AppTextStyleHelper.font62WhiteExtraBold,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              decoration: const BoxDecoration(
                color: AppColorHelper.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
                child: registrationForm,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
