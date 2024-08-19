import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/empty_screen.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';
import 'package:marketos/features/cart/ui/widgets/item.dart';
import 'package:marketos/features/favorite/logic/get_favorite_cubit/get_favorite_cubit.dart';
import 'package:marketos/features/favorite/logic/get_favorite_cubit/get_favorite_states.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {

  @override
  void initState() {
    context.read<GetFavoriteCubit>().getFavorites();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetFavoriteCubit,GetFavoriteState>(
      builder: (context,state) {
        if (state is GetFavoriteLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is GetFavoriteError) {
          return Center(
            child: Text(state.message),
          );
        }
        if (state is GetFavoriteSuccess) {
          if (state.favoriteProducts.isEmpty) {
            return const EmptyScreen(
                image: AppImageHelper.emptyFavoriteImage,
                text: 'favorite',
              );
          }
          else {
            return ListView.separated(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              itemBuilder: (context, index) => Item(
                productName: state.favoriteProducts[index].name,
                productPrice: state.favoriteProducts[index].price.toStringAsExponential(2),
                image: state.favoriteProducts[index].image,
              ),
              separatorBuilder: (context, index) => SizedBox(
                height: 20.h,
              ),
              itemCount: state.favoriteProducts.length,
            );
          }
        }
        return const SizedBox();
      }
    );
  }
}
