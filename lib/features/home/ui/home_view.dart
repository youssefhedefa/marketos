import 'package:flutter/material.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/ui/widgets/custom_categories_list.dart';


class HomeView extends StatelessWidget {
  const HomeView({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            'Order Online\ncollect in store',
          style: isDrawerOpen ? AppTextStyleHelper.font36BlackBold : AppTextStyleHelper.font46BlackBold,
        ),
        const SizedBox(height: 20),
        const CustomCategoriesList(),
      ],
    );
  }
}
