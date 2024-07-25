import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

class CustomRegistrationInputField extends StatelessWidget {
  const CustomRegistrationInputField(
      {super.key,
      required this.title,
      required this.titleIcon,
      required this.isPassword,
      required this.hint, this.onTap, required this.showPassword});

  final String title;
  final String hint;
  final IconData titleIcon;
  final bool isPassword;
  final void Function()? onTap;
  final bool showPassword;


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              titleIcon,
              color: Colors.grey,
              size: 28,
            ),
            const SizedBox(
              width: 8,
            ),
            Text(
              title,
              style: AppTextStyleHelper.font26GrayBold,
            ),
          ],
        ),
        TextFormField(
          cursorColor: Colors.black,
          style: AppTextStyleHelper.font26BlackMedium,
          obscureText: showPassword,
          decoration: InputDecoration(
            contentPadding: EdgeInsets.zero,
            suffixIcon: isPassword
                ? GestureDetector(
                    onTap: onTap,
                    child: const Text(
                      'show',
                      style: AppTextStyleHelper.font22PurpleBold,
                    ),
                  )
                : null,
            hintText: hint,
            hintStyle: AppTextStyleHelper.font26GrayBold,
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black,
              ),
            ),
            errorBorder: const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.red,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
