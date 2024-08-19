import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

class EmptyScreen extends StatelessWidget {
  const EmptyScreen({super.key, required this.image, required this.text});

  final String image;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: MediaQuery.of(context).size.width,
        color: const Color(0xffF5F4F9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              image,
              width: 350,
              height: 350,
            ),
            Text(
              'No items in your $text yet!',
              style: AppTextStyleHelper.font32BlackBold,
            ),
          ],
        ),
      ),
    );
  }
}
