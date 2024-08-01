import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/components/custom_drawer_item.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';


class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageHelper.drawerBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child: const Column(
          children: [
            SizedBox(
              height: 140,
            ),
            CustomDrawerItem(
              title: 'Profile',
              icon: FontAwesomeIcons.user,
            ),
            CustomDrawerItem(
              title: 'My Cart',
              icon: Icons.shopping_cart_outlined,
            ),
            CustomDrawerItem(
              title: 'Favorites',
              icon: Icons.favorite_border,
            ),
            CustomDrawerItem(
              title: 'Settings',
              icon: Icons.settings_outlined,
            ),
          ],
        ),
      ),
    );
  }
}
