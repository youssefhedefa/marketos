import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_cubit.dart';
import 'package:marketos/features/home/logic/cubits/get_category_cubit/get_categories_states.dart';
import 'package:marketos/features/home/logic/cubits/get_products_by_category/get_products_by_category_cubit.dart';
import 'package:marketos/features/home/ui/widgets/categories/custom_category_item.dart';

class CustomCategoriesList extends StatefulWidget {
  const CustomCategoriesList({super.key});

  @override
  State<CustomCategoriesList> createState() => _CustomCategoriesListState();
}

class _CustomCategoriesListState extends State<CustomCategoriesList> {

  int selectedIndex = 0;

  @override
  void initState() {
    context.read<GetCategoriesCubit>().getCategoriesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetCategoriesCubit,GetCategoriesState>(
      builder: (context,state) {
        if(state is GetCategoriesSuccessState) {
          return SizedBox(
            height: 60.h,
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    setState(() {
                      selectedIndex = index;
                      context.read<GetProductByCategoryCubit>().getProductByCategory(state.categories[index].ref);
                    });
                  },
                  child: CustomCategoryItem(
                    categoryName: state.categories[index].category,
                    isSelected: selectedIndex == index ? true : false,
                  ),
                );
              },
              separatorBuilder: (context, index) {
                return const SizedBox(width: 20);
              },
              itemCount: state.categories.length,
              scrollDirection: Axis.horizontal,
            ),
          );
        }
        else if(state is GetCategoriesErrorState) {
          return Center(child: Text(state.message));
        }
        else {
          return const Center(child: CircularProgressIndicator());
        }

      }
    );
  }
}



