import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/di/di.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/profile/logic/cubits/change_address_cubit/change_Address_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_image_cubit/change_image_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_image_cubit/change_image_states.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_cubit.dart';
import 'package:marketos/features/profile/logic/cubits/change_name_cubit/change_name_states.dart';
import 'package:marketos/features/profile/logic/cubits/get_profile_cubit/get_profile_cubit.dart';
import 'package:marketos/features/profile/ui/widgets/edit_profile_option.dart';

class EditProfileOptionsList extends StatefulWidget {
  const EditProfileOptionsList({super.key, required this.isDrawerOpened});

  final bool isDrawerOpened;

  @override
  State<EditProfileOptionsList> createState() => _EditProfileOptionsListState();
}

class _EditProfileOptionsListState extends State<EditProfileOptionsList> {

  late TextEditingController nameController;

  @override
  void initState() {
    nameController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      children: [
        BlocBuilder<ChangeNameCubit, ChangeNameState>(
          builder: (context,state) {
            return EditProfileOption(
              title: 'Change Name',
              isDrawerOpened: widget.isDrawerOpened,
              onTap: () {
                nameBottomSheet();
              },
            );
          }
        ),
        SizedBox(height: 20.h),
        BlocBuilder<ChangeImageCubit, ChangeImageState>(
          builder: (context, state) {
            return EditProfileOption(
              title: 'Change Image',
              isDrawerOpened: widget.isDrawerOpened,
              onTap: () {
                changeImage();
              },
            );
          },
        ),
        SizedBox(height: 20.h),
        BlocProvider(
          create: (context)=> getIt<ChangeAddressCubit>(),
          child: EditProfileOption(
            isDrawerOpened: widget.isDrawerOpened,
            title: 'Change Address',
            onTap: () {
              Navigator.pushNamed(context, AppRoutingConstants.map).then((value) => context.read<GetProfileCubit>().getProfile());
            },
          ),
        ),
        SizedBox(height: 20.h),
      ],
    );
  }

  nameBottomSheet() {
    showModalBottomSheet(
      context: context,
      builder: (newContext) {
        return MultiBlocProvider(
          providers: [
            BlocProvider(
              create: (context)=> getIt<ChangeNameCubit>(),
            ),
            BlocProvider(
              create: (context)=> getIt<GetProfileCubit>(),
            )
          ],
          child: Padding(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                TextField(
                  controller: nameController,
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
                    if (state is ChangeImageLoading) {
                      return SizedBox(
                        height: 70.h,
                        child: const Center(
                          child: CircularProgressIndicator(),
                        ),
                      );
                    }
                    return CustomButton(
                      text: 'Change Name',
                      onTap: () {
                        context.read<ChangeNameCubit>().changeName(
                            name: nameController.text,
                        );
                      },
                      color: Theme.of(context).primaryColor,
                      textStyle: AppTextStyleHelper.font26WhiteBold,
                    );
                  },
                  listener: (context, state) {
                    if (state is ChangeNameSuccess) {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text('Name changed successfully')));
                      nameController.clear();
                      Navigator.pop(context);
                      Navigator.pop(context,true);
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
    ).then((value) => context.read<GetProfileCubit>().getProfile());
  }

  changeImage() {
    context.read<ChangeImageCubit>().pickImage().then((value) {
      if (value != null) {
        context.read<ChangeImageCubit>().changeImage(image: value).then((value) => context.read<GetProfileCubit>().getProfile());

      }
    }).catchError((e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No image selected',
          ),
        ),
      );
    });
  }
}