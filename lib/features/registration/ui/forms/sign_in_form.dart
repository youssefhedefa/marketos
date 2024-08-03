import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/components/app_regex.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_cubit.dart';
import 'package:marketos/features/registration/logic/cubits/sign_in_cubit/sign_in_states.dart';
import 'package:marketos/features/registration/ui/registration_view.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_input_field.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_text.dart';

class SignInForm extends StatefulWidget {
  const SignInForm({super.key});

  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  bool passwordObscure = true;
  bool confirmPasswordObscure = true;

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
            const SizedBox(
              height: 16,
            ),
            Text(
              'Sign In',
              style: AppTextStyleHelper.font26BlackBold,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRegistrationInputField(
              controller: context.read<SignInCubit>().emailController,
              isPassword: false,
              showPassword: false,
              title: 'Email',
              hint: 'Enter your email',
              titleIcon: FontAwesomeIcons.envelope,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your email';
                } else if (AppRegexValidator.isValidEmail(value) == false) {
                  return 'Please enter a valid email';
                }
                return null;
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRegistrationInputField(
              isPassword: true,
              controller: context.read<SignInCubit>().passwordController,
              showPassword: passwordObscure,
              title: 'Password',
              titleIcon: Icons.lock_outline,
              hint: 'Enter your password',
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please enter your password';
                } else if (AppRegexValidator.isValidPassword(value) == false) {
                  return 'Password must contain at least 8 characters,\n one uppercase letter,\n one lowercase letter,\n one number and one special character.';
                }
                return null;
              },
              onTap: () {
                setState(() {
                  passwordObscure = !passwordObscure;
                });
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRegistrationInputField(
              isPassword: true,
              controller: context.read<SignInCubit>().confirmPasswordController,
              title: 'Confirm The Password',
              titleIcon: Icons.lock_outline,
              hint: 'Rewrite your password',
              showPassword: confirmPasswordObscure,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please confirm your password';
                } else if (value !=
                    context.read<SignInCubit>().passwordController.text) {
                  return 'Passwords do not match';
                }
                return null;
              },
              onTap: () {
                setState(() {
                  confirmPasswordObscure = !confirmPasswordObscure;
                });
              },
            ),
            const SizedBox(
              height: 40,
            ),
            BlocConsumer<SignInCubit, SignInStates>(
              builder: (context, state) {
                if (state is SignInLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  text: 'Sign In',
                  onTap: signInAction,
                  color: AppColorHelper.primaryColor,
                  textStyle: AppTextStyleHelper.font26WhiteBold,
                );
              },
              listener: (BuildContext context, SignInStates state) {
                if (state is SignInSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutingConstants.home, (route) => false);
                }
                if (state is SignInErrorState) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(state.error.message),
                    ),
                  );
                }
              },
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRegistrationText(
              text: 'Already have an account? Log in',
              onTap: () {
                Navigator.pushNamed(context, AppRoutingConstants.logIn);
              },
            ),
          ],
        ),
      ),
    );
  }

  signInAction() {
    if (context.read<SignInCubit>().formKey.currentState!.validate()) {
      context.read<SignInCubit>().signInStates(
        email: context.read<SignInCubit>().emailController.text,
        password: context.read<SignInCubit>().passwordController.text,
      );
    }
  }
}
