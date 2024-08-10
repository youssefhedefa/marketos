import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/home/data/models/view_all_model.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_states.dart';


class ViewAllCustomTextButton extends StatelessWidget {
  const ViewAllCustomTextButton({super.key, required this.isDrawerOpen});

  final bool isDrawerOpen;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProductByCategoryCubit,GetProductsByCategoryState>(
      builder: (context,state) {
        if(state is GetProductsByCategorySuccessState){
          return GestureDetector(
            onTap: () {
              var model = ViewAllModel(
                categoryName: getProductCategory(state.products[0].prodactCategory),
                products: state.products,
              );
              Navigator.pushNamed(context, AppRoutingConstants.viewAll, arguments: model);
            },
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  'View All',
                  style: isDrawerOpen
                      ? AppTextStyleHelper.font26PurpleBold
                      : AppTextStyleHelper.font22PurpleBold,
                ),
                const SizedBox(width: 8),
                Icon(
                  Icons.arrow_forward,
                  color: AppColorHelper.primaryColor,
                  size: isDrawerOpen ? 20 : 24,)
              ],
            ),
          );
        }
        return const SizedBox();
      }
    );
  }

  String getProductCategory(String category) {

    List<String> words = category.split('-');

    List<String> capitalizedWords = words.map((word) {
      return word[0].toUpperCase() + word.substring(1);
    }).toList();

    String result = capitalizedWords.join(' ');

    return result;
  }

}