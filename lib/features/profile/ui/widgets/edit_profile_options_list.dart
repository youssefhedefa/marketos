import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_cubit.dart';
import 'package:marketos/features/profile/ui/widgets/edit_profile_option.dart';

class EditProfileOptionsList extends StatelessWidget {
  const EditProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        EditProfileOption(
          title: 'Change Name',
          onTap: (){
            print('object');
            context.read<ChangeNameCubit>().changeName(name: 'name');
          },
        ),
        SizedBox(height: 20.h),
        const EditProfileOption(
          title: 'Change Image',
        ),
        SizedBox(height: 20.h),
        const EditProfileOption(
          title: 'Change Address',
        ),
        SizedBox(height: 20.h),
      ],
    );
  }
}
