import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/registration/logic/cubits/sigin_in_cubit/sign_in_cubit.dart';
import 'package:marketos/features/registration/ui/registration_view.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_input_field.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_text.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return RegistrationView(
        title: 'Welcome to \nMarketos',
        registrationForm: Form(
          key: context.read<SignInCubit>().formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            children: [
              const SizedBox(height: 16,),
              const Text(
                'Sign In',
                style: AppTextStyleHelper.font26BlackBold,
              ),
              const SizedBox(height: 20,),
              CustomRegistrationInputField(
                controller: context.read<SignInCubit>().emailController,
                isPassword: false,
                showPassword: false,
                title: 'Email',
                hint: 'Enter your email',
                titleIcon: FontAwesomeIcons.envelope,
              ),
              const SizedBox(height: 20,),
              CustomRegistrationInputField(
                isPassword: true,
                controller: context.read<SignInCubit>().passwordController,
                showPassword: passwordVisible,
                title: 'Password',
                titleIcon: Icons.lock_outline,
                hint: 'Enter your password',
                onTap: (){
                  setState(() {
                    passwordVisible = !passwordVisible;
                  });
                },
              ),
              const SizedBox(height: 20,),
              CustomRegistrationInputField(
                isPassword: true,
                controller: context.read<SignInCubit>().confirmPasswordController,
                title: 'Confirm The Password',
                titleIcon: Icons.lock_outline,
                hint: 'Rewrite your password',
                showPassword: confirmPasswordVisible,
                onTap: (){
                  setState(() {
                    confirmPasswordVisible = !confirmPasswordVisible;
                  });
                },
              ),
              const SizedBox(height: 40,),
              CustomButton(
                text: 'Sign In',
                onTap: (){},
                color: AppColorHelper.primaryColor,
                textStyle: AppTextStyleHelper.font26WhiteBold,
              ),
              const SizedBox(height: 20,),
              CustomRegistrationText(
                text: 'Already have an account? Sign in',
                onTap: (){
                  Navigator.pushNamed(context, AppRoutingConstants.logIn);
                },
              ),
            ],
          ),
        ),
    );
  }
}
