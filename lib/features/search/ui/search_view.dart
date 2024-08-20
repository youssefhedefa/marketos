import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/empty_screen.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/image_assets_helper.dart';
import 'package:marketos/features/home/data/models/view_all_model.dart';
import 'package:marketos/features/home/ui/widgets/view_all/view_all_body.dart';
import 'package:marketos/features/search/logic/search_cubit/search_cubit.dart';
import 'package:marketos/features/search/logic/search_cubit/search_states.dart';
import 'package:marketos/features/search/ui/widgets/custom_search_app_bar.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.whiteColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: REdgeInsets.all(24.0),
        child: Column(
          children: [
            const CustomSearchAppBar(),
            BlocBuilder<SearchCubit, SearchState>(builder: (context, state) {
              if (state is SearchLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is SearchErrorState) {
                return Center(child: Text(state.message));
              }
              if (state is SearchSuccessState) {
                if (state.products.isEmpty) {
                  return const SingleChildScrollView(
                    child: EmptyScreen(
                        image: AppImageHelper.searchNotFoundImage,
                        text: 'list'),
                  );
                }
                return Expanded(
                  child: ViewAllBody(
                    viewAllModel: ViewAllModel(
                      categoryName: ' ',
                      products: state.products,
                    ),
                  ),
                );
              }
              return const SingleChildScrollView(
                child: EmptyScreen(
                    image: AppImageHelper.searchNotFoundImage,
                    text: 'list'),
              );
            }),
          ],
        ),
      ),
    );
  }
}
