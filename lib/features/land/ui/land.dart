import 'package:flutter/material.dart';
import 'package:marketos/core/components/custom_search_field.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/features/land/ui/widgets/custom_drawer.dart';

class Land extends StatefulWidget {
  const Land({super.key});

  @override
  State<Land> createState() => _LandState();
}

class _LandState extends State<Land> with SingleTickerProviderStateMixin {

  bool isDrawerOpen = false;

  late AnimationController animationController;
  late Animation scaleAnimation;

  @override
  void initState() {
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 250),
    )..addListener(() {
      setState(() {});
    });
    scaleAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: animationController,
        curve: Curves.easeInOut,
      ),
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          const CustomDrawer(),
          Transform.translate(
            offset: Offset(scaleAnimation.value * 260, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: isDrawerOpen ? MediaQuery.sizeOf(context).height * 0.7 : MediaQuery.sizeOf(context).height,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: isDrawerOpen ?  const BorderRadius.only(
                    topLeft: Radius.circular(40),
                    bottomLeft: Radius.circular(40),
                  ) : null,
                  boxShadow: const [
                    BoxShadow(
                      color: AppColorHelper.lightPrimaryColor,
                      blurRadius: 0,
                      spreadRadius: 5,
                      offset: Offset(-40, 40),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 70,
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                              if(isDrawerOpen) {
                                animationController.reverse();
                                setState(() {
                                  isDrawerOpen = !isDrawerOpen;
                                });
                              } else {
                                animationController.forward();
                                setState(() {
                                  isDrawerOpen = !isDrawerOpen;
                                });
                              }
                            },
                            icon:  Icon(
                               isDrawerOpen ? Icons.close :Icons.menu,
                            ),
                          ),
                          const Expanded(child: CustomSearchField()),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
