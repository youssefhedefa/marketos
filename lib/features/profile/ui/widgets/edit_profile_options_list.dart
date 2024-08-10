import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_states.dart';
import 'package:marketos/features/profile/ui/widgets/edit_profile_option.dart';

class EditProfileOptionsList extends StatefulWidget {
  const EditProfileOptionsList({super.key});

  @override
  State<EditProfileOptionsList> createState() => _EditProfileOptionsListState();
}

class _EditProfileOptionsListState extends State<EditProfileOptionsList> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        EditProfileOption(
          title: 'Change Name',
          onTap: () {
            nameBottomSheet();
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

  nameBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (newContext) {
        return BlocProvider.value(
          value: getIt<ChangeNameCubit>(),
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                TextField(
                  controller: context.read<ChangeNameCubit>().nameController,
                  decoration: InputDecoration(
                    hintText: 'Enter your name',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                  ),
                ),
                SizedBox(height: 40.h),
                BlocConsumer<ChangeNameCubit, ChangeNameState>(
                  builder: (context, state) {
                    return CustomButton(
                      text: 'Change Name',
                      onTap: () {
                        context.read<ChangeNameCubit>().changeName(
                            name: context
                                .read<ChangeNameCubit>()
                                .nameController
                                .text);
                      },
                      color: Theme.of(context).primaryColor,
                      textStyle: AppTextStyleHelper.font26WhiteBold,
                    );
                  },
                  listener: (context, state) {
                    if (state is ChangeNameSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Name changed successfully')));
                      Navigator.pop(context);
                      Navigator.pop(context);
                    }
                    if (state is ChangeNameFailed) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            state.message,
                          ),
                        ),
                      );
                    }
                    if (state is ChangeNameLoading) {
                      showDialog(
                        context: context,
                        builder: (context) => const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                  },
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
