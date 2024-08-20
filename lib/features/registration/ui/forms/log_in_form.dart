import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/components/app_regex.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/registration/logic/cubits/log_in_cubit/log_in_cubit.dart';
import 'package:marketos/features/registration/logic/cubits/log_in_cubit/log_in_states.dart';
import 'package:marketos/features/registration/ui/registration_view.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_input_field.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool passwordObscure = true;

  @override
  Widget build(BuildContext context) {
    return RegistrationView(
      title: 'Welcome \nBack',
      registrationForm: Form(
        key: context.read<LogInCubit>().formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            Text(
              'Log In',
              style: AppTextStyleHelper.font26BlackBold,
            ),
            const SizedBox(
              height: 20,
            ),
            CustomRegistrationInputField(
              controller: context.read<LogInCubit>().emailController,
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
              controller: context.read<LogInCubit>().passwordController,
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
              height: 40,
            ),
            BlocConsumer<LogInCubit, LogInStates>(
              builder: (context, state) {
                if (state is LogInLoadingState) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CustomButton(
                  text: 'Log In',
                  onTap: logInAction,
                  color: AppColorHelper.primaryColor,
                  textStyle: AppTextStyleHelper.font26WhiteBold,
                );
              },
              listener: (BuildContext context, LogInStates state) {
                if (state is LogInSuccessState) {
                  Navigator.pushNamedAndRemoveUntil(context, AppRoutingConstants.land, (route) => false);
                }
                if (state is LogInErrorState) {
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
              text: 'Create an account',
              onTap: () {
                Navigator.pushNamed(context, AppRoutingConstants.signIn);
              },
            ),
          ],
        ),
      ),
    );
  }

  void logInAction() {
    if (context.read<LogInCubit>().formKey.currentState!.validate()) {
      context.read<LogInCubit>().logInStates(
            email: context.read<LogInCubit>().emailController.text,
            password: context.read<LogInCubit>().passwordController.text,
          );
    }
  }
}
