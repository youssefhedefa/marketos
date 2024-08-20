import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_search_field.dart';
import 'package:marketos/core/components/functions/calculate_height.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';


class CustomLandAppBar extends StatelessWidget {
  const CustomLandAppBar({super.key, required this.isDrawerOpen, this.onPressed, required this.currentViewIndex});

  final bool isDrawerOpen;
  final void Function()? onPressed;
  final int currentViewIndex;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: calculateHeight(
            isDrawerOpened: isDrawerOpen,
            heightWhenDrawerClosed: 70.h,
            heightWhenDrawerOpened: 20.h,
          ),
        ),
        Row(
          children: [
            IconButton(
              onPressed: onPressed,
              icon: Icon(
                isDrawerOpen ? Icons.close : Icons.menu,
                size: 34.r,
              ),
            ),
            currentViewIndex == 1
                ? Padding(
              padding: const EdgeInsets.only(left: 24.0),
              child: Text(
                'My Profile',
                style: AppTextStyleHelper.font32BlackBold,
              ),
            )
                : Expanded(
              child: GestureDetector(
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutingConstants.searchView,
                  );
                },
                child: const CustomSearchField(),
              ),
            ),
          ],
        ),
        SizedBox(
          height: calculateHeight(
            isDrawerOpened: isDrawerOpen,
            heightWhenDrawerClosed: 24.h,
            heightWhenDrawerOpened: 20.h,
          ),
        ),
      ],
    );
  }
}
