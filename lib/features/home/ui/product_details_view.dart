import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/networking/firebase/models/cart_product_details_model.dart';
import 'package:marketos/features/home/domain/entities/home_product_entity.dart';
import 'package:marketos/features/home/logic/cubits/add_to_favorite_cubit/add_to_favorite_cubit.dart';
import 'package:marketos/features/home/logic/cubits/add_to_favorite_cubit/add_to_favorite_state.dart';
import 'package:marketos/features/home/logic/cubits/check_favorite_state_cubit/check_favorite_state_cubit.dart';
import 'package:marketos/features/home/logic/cubits/check_favorite_state_cubit/check_favorite_state_states.dart';
import 'package:marketos/features/home/logic/cubits/remove_from_favorite_cubit/remove_from_favorite_cubit.dart';
import 'package:marketos/features/home/logic/cubits/remove_from_favorite_cubit/remove_from_favorite_states.dart';
import 'package:marketos/features/home/ui/widgets/product_details/image_gallery.dart';
import 'package:marketos/features/home/ui/widgets/product_details/product_information.dart';

class ProductDetailsView extends StatelessWidget {
  const ProductDetailsView({super.key, required this.product});

  final HomeProductEntity product;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.darkWhiteColor,
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context, true);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        actions: [
          BlocBuilder<CheckFavoriteStateCubit,CheckFavoriteState>(
            builder: (context,state) {
              if (state is CheckFavoriteLoading) {
                return const SizedBox(
                  width: 40,
                  height: 40,
                  child: FittedBox(child: CircularProgressIndicator()),
                );
              }
              if (state is CheckFavoriteSuccess) {
                if(state.isFavorite){
                  return BlocConsumer<RemoveFromFavoriteCubit,RemoveFromFavoriteState>(
                    builder: (context,state) {
                      return IconButton(
                        onPressed: () {
                          context.read<RemoveFromFavoriteCubit>().removeFromFavorite(
                            productID: product.productID,
                          );
                        },
                        icon: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.favorite),
                        ),
                      );
                    },
                    listener: (context,state) {
                      if (state is RemoveFromFavoriteSuccessState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product removed from favorite'),
                          ),
                        );
                        context.read<CheckFavoriteStateCubit>().checkFavorite(productID: product.productID);
                        Navigator.pop(context);
                      }
                      if (state is RemoveFromFavoriteErrorState) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to add product to favorite'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                      if(state is RemoveFromFavoriteLoadingState){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      }
                    },
                  );
                }
                else {
                  return BlocConsumer<AddToFavoriteCubit,AddToFavoriteState>(
                    builder: (context,state) {
                      return IconButton(
                        onPressed: () {
                          context.read<AddToFavoriteCubit>().addToFavorite(
                            product: ProductInCartDetails(
                              id: product.productID,
                              quantity: 1,
                              price: product.productPrice,
                            ),
                          );
                        },
                        icon: const SizedBox(
                          width: 40,
                          height: 40,
                          child: Icon(Icons.favorite_border),
                        ),
                      );
                    },
                    listener: (context,state){
                      if (state is AddToFavoriteSuccess) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Product added to favorite'),
                          ),
                        );
                        context.read<CheckFavoriteStateCubit>().checkFavorite(productID: product.productID);
                        Navigator.pop(context);
                      }
                      if (state is AddToFavoriteFailure) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Failed to add product to favorite'),
                          ),
                        );
                        Navigator.pop(context);
                      }
                      if(state is AddToFavoriteLoading){
                        showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          },
                        );
                      }
                    },
                  );
                }
              }
              return const SizedBox();
            }
          ),
        ],
        backgroundColor: AppColorHelper.darkWhiteColor,
        surfaceTintColor: AppColorHelper.darkWhiteColor,
      ),
      body: Column(
        children: [
          ImagesGallery(
            mainImage: product.image,
            otherImages: product.otherImages,
          ),
          ProductInformation(
            id: product.productID,
            name: product.name,
            description: product.productDescription,
            price: product.productPrice,
          ),
        ],
      ),
    );
  }
}
