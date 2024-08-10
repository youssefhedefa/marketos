import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_search_field.dart';
import 'package:marketos/core/components/functions/calculate_height.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:marketos/features/home/ui/home_view.dart';
import 'package:marketos/features/land/ui/widgets/custom_drawer.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_cubit.dart';
import 'package:marketos/features/profile/ui/profile_view.dart';

class Land extends StatefulWidget {
  const Land({super.key});

  @override
  State<Land> createState() => _LandState();
}

class _LandState extends State<Land> with SingleTickerProviderStateMixin {
  bool isDrawerOpen = false;
  int currentViewIndex = 0;

  late AnimationController animationController;
  late Animation scaleAnimation;

  late List<Widget> views;

  void changeView(int index) {
    setState(() {
      currentViewIndex = index;
      isDrawerOpen = false;
      animationController.reverse();
    });
  }

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
    views = [
      MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt<GetCategoriesCubit>(),
          ),
          BlocProvider.value(
            value: getIt<GetProductByCategoryCubit>(),
          ),
        ],
        child: HomeView(
          isDrawerOpen: isDrawerOpen,
        ),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider.value(
            value: getIt<ChangeNameCubit>(),
          ),
        ],
        child: ProfileView(
          isDrawerOpened: isDrawerOpen,
        ),
      ),
      const Scaffold(),
      const Scaffold(),
      const Scaffold(),
    ];
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      body: Stack(
        children: [
          CustomDrawer(
            changeView: changeView,
          ),
          Transform.translate(
            offset: Offset(scaleAnimation.value * 260.w, 0),
            child: Align(
              alignment: Alignment.centerRight,
              child: Container(
                width: MediaQuery.sizeOf(context).width,
                height: calculateHeight(
                  isDrawerOpened: isDrawerOpen,
                  heightWhenDrawerClosed: MediaQuery.sizeOf(context).height,
                  heightWhenDrawerOpened:
                      MediaQuery.sizeOf(context).height * 0.7,
                ),
                decoration: BoxDecoration(
                  color: AppColorHelper.darkWhiteColor,
                  borderRadius: isDrawerOpen
                      ? const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          bottomLeft: Radius.circular(40),
                        )
                      : null,
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
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                            onPressed: () {
                              if (isDrawerOpen) {
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
                              : const Expanded(
                                  child: CustomSearchField(),
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
                      views[currentViewIndex],
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
