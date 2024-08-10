import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_states.dart';


class ProfileCard extends StatelessWidget {
  const ProfileCard({super.key, required this.isDrawerOpened});

  final bool isDrawerOpened;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetProfileCubit,GetProfileState>(
      builder: (context,state) {
        if(state is GetProfileSuccess){
          return SizedBox(
            height: isDrawerOpened ? 200.h : 250.h,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: isDrawerOpened ? 170.h :  210.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26.r),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SizedBox(height: isDrawerOpened ? 10.h :  46.h),
                      Text(
                        state.profile.name,
                        style: AppTextStyleHelper.font32BlackBold,
                      ),
                      Text(
                        state.profile.email,
                        style: AppTextStyleHelper.font22BlackMedium,
                      ),
                      Text(
                        state.profile.address,
                        style: AppTextStyleHelper.font22BlackMedium,
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 0,
                  child: CircleAvatar(
                    radius: isDrawerOpened ? 20.r :  56.r,
                    backgroundColor: Colors.white,
                    child:
                    Image.network(state.profile.imageUrl),
                  ),
                ),
              ],
            ),
          );
        }
        else if(state is GetProfileFailed){
          return SizedBox(
            height: isDrawerOpened ? 200.h : 250.h,
            child: Container(
              height: isDrawerOpened ? 170.h :  210.h,
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: isDrawerOpened ? 10.h :  46.h),
                  Text(
                    'Error',
                    style: AppTextStyleHelper.font32BlackBold,
                  ),
                  Text(
                    state.message,
                    style: AppTextStyleHelper.font22BlackMedium,
                  ),
                ],
              ),
            ),
          );
        }
        else{
          return SizedBox(
            height: isDrawerOpened ? 200.h : 250.h,
            child: Container(
              height: isDrawerOpened ? 170.h :  210.h,
              width: double.infinity,
              padding: EdgeInsets.all(20.r),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(26.r),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: isDrawerOpened ? 10.h :  46.h),
                  Text(
                    'Loading..',
                    style: AppTextStyleHelper.font32BlackBold,
                  ),
                  Text(
                    'Please wait..',
                    style: AppTextStyleHelper.font22BlackMedium,
                  ),
                ],
              ),
            ),
          );
        }
      }
    );
  }
}
