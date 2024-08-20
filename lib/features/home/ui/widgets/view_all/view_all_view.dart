import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/home/data/models/view_all_model.dart';
import 'package:marketos/features/home/ui/widgets/view_all/view_all_body.dart';

class ViewAllView extends StatelessWidget {
  const ViewAllView({super.key,required this.viewAllModel,});

  final ViewAllModel viewAllModel;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.darkWhiteColor,
      appBar: AppBar(
        title: Text(
            viewAllModel.categoryName,
          style: AppTextStyleHelper.font36BlackBold,
        ),
        backgroundColor: AppColorHelper.darkWhiteColor,
        surfaceTintColor: AppColorHelper.darkWhiteColor,
      ),
      body: Column(
        children: [
          Expanded(
            child: ViewAllBody(viewAllModel: viewAllModel),
          ),
          SizedBox(height: 20.h),
        ],
      ),
    );
  }
}
