import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';
import 'package:marketos/core/networking/firebase/firebase_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/land/ui/widgets/custom_drawer_item.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({super.key, required this.changeView});

  final Function changeView;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(AppImageHelper.drawerBackgroundImage),
            fit: BoxFit.cover,
          ),
        ),
        child:  Column(
          children: [
            const SizedBox(
              height: 140,
            ),
            CustomDrawerItem(
              title: 'Shop',
              icon: FontAwesomeIcons.shop,
              onTap: () {
                changeView(0);
              },
            ),
            CustomDrawerItem(
              title: 'Profile',
              icon: FontAwesomeIcons.user,
              onTap: () {
                changeView(1);
              },
            ),
            CustomDrawerItem(
              title: 'Cart',
              icon: Icons.shopping_cart_outlined,
              onTap: () {
                changeView(2);
              },
            ),
            CustomDrawerItem(
              title: 'Favorites',
              icon: Icons.favorite_border,
              onTap: () {
                changeView(3);
              },
            ),
            const Spacer(),
            CustomDrawerItem(
              title: 'Sign Out',
              icon: Icons.logout,
              onTap: (){
                AppFireBaseHelper().signOut().then((value) => Navigator.pushNamedAndRemoveUntil(context, AppRoutingConstants.splash, (route) => false));
              },
            ),
            const SizedBox(
              height: 60,
            ),
          ],
        ),
      ),
    );
  }
}
