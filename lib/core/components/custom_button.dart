import 'package:flutter/material.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({super.key, required this.onTap, required this.text, required this.textStyle, required this.color});

  final void Function() onTap;
  final String text;
  final TextStyle textStyle;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 70,
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(6),
        ),
        child: Center(
          child: Text(
            text,
            style: textStyle,
          ),
        ),
      ),
    );
  }
}
