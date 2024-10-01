import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/functions/calculate_height.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/features/cart/logic/cubits/get_cart_cubit/get_cart_cubit.dart';
import 'package:marketos/features/cart/logic/cubits/get_payment_methods_cubit/get_payment_methods_cubit.dart';
import 'package:marketos/features/cart/ui/cart_view.dart';
import 'package:marketos/features/favorite/logic/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:marketos/features/favorite/ui/favorite_view.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:marketos/features/home/ui/home_view.dart';
import 'package:marketos/features/land/ui/widgets/custom_drawer.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_Address_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_image_cubit/change_image_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:marketos/features/profile/ui/profile_view.dart';
import 'widgets/custom_land_app_bar.dart';

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
          BlocProvider(
            create: (context)=> getIt<GetCategoriesCubit>(),
          ),
          BlocProvider(
            create: (context)=> getIt<GetProductByCategoryCubit>(),
          ),
        ],
        child: HomeView(
          isDrawerOpen: isDrawerOpen,
        ),
      ),
      MultiBlocProvider(
        providers: [
          BlocProvider(
            create:(context)=> getIt<GetProfileCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ChangeNameCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ChangeImageCubit>(),
          ),
          BlocProvider(
            create: (context) => getIt<ChangeAddressCubit>(),
          ),
        ],
        child: ProfileView(
          isDrawerOpened: isDrawerOpen,
        ),
      ),
      MultiBlocProvider(
        providers: [
        BlocProvider(create: (context) => getIt<GetCartCubit>()),
          BlocProvider(create: (context) => getIt<GetPaymentMethodsCubit>()),
          BlocProvider(create: (context) => getIt<GetProfileCubit>()),
        ],
          child: CartView(
            isDrawerOpened: isDrawerOpen,
          ),
      ),
      BlocProvider(
        create: (context) => getIt<GetFavoriteCubit>(),
          child: const FavoriteView(),
      ),
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
                      CustomLandAppBar(
                        isDrawerOpen: isDrawerOpen,
                        currentViewIndex: currentViewIndex,
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
                      ),
                      Expanded(child: views[currentViewIndex]),
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


