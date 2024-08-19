import 'package:flutter/material.dart';
import 'package:marketos/core/components/empty_screen.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';


class FavoriteView extends StatelessWidget {
  const FavoriteView({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyScreen(
      image: AppImageHelper.emptyFavoriteImage,
      text: 'favorite',
    );
  }
}
