import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_search_field.dart';
import 'package:marketos/features/search/logic/search_cubit/search_cubit.dart';
import 'package:marketos/features/search/logic/search_cubit/search_states.dart';

class CustomSearchAppBar extends StatelessWidget {
  const CustomSearchAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 70.h,
        ),
        Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back,
                size: 34.r,
              ),
            ),
            Expanded(
              child: CustomSearchField(
                enabled: true,
                onChanged: (value) {
                  if(value.isEmpty){
                    context.read<SearchCubit>().stream.listen((state) {
                      if(state is SearchSuccessState){
                        state.products.clear();
                      }
                    });
                  }
                  context.read<SearchCubit>().search(query: value);
                },
              ),
            ),
          ],
        ),
        SizedBox(
          height: 24.h,
        ),
      ],
    );
  }
}
