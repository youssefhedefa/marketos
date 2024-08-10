import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/features/profile/ui/widgets/edit_profile_option.dart';

class EditProfileOptionsList extends StatelessWidget {
  const EditProfileOptionsList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        const EditProfileOption(
          title: 'Change Name',
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
