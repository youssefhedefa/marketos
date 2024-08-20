import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';

class CustomSearchField extends StatelessWidget {
  const CustomSearchField({super.key, this.onTap, this.controller, this.enabled, this.onChanged});

  final void Function()? onTap;
  final TextEditingController? controller;
  final bool? enabled;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: TextField(
        onChanged: onChanged,
        controller: controller,
        decoration: InputDecoration(
          contentPadding: const EdgeInsets.symmetric(
            vertical: 10,
            horizontal: 16,
          ),
          hintText: 'Search',
          hintStyle: AppTextStyleHelper.font22DarkGreyBold,
          enabled: enabled ?? false,
          prefixIcon:const Icon(
            Icons.search,
            size: 30,
            color: Colors.black,
          ),
          border: borderDesign(),
          focusedBorder: borderDesign(isFocused: true),
          enabledBorder: borderDesign(),
          disabledBorder: borderDesign(),
        ),
      ),
    );
  }

  InputBorder borderDesign({bool isFocused = false}){
    return isFocused ? const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColorHelper.primaryColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          24,
        ),
      ),
    ) : const OutlineInputBorder(
      borderSide: BorderSide(
        color: AppColorHelper.greyColor,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(
          24,
        ),
      ),
    );
  }

}
