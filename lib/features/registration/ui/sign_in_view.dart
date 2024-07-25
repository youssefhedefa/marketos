import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_input_field.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_text.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {

  bool passwordVisible = false;
  bool confirmPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColorHelper.primaryColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(
                top: 90,
              left: 38,
              bottom: 40,
            ),
            child: Text(
              'Welcome to Marketos',
              style: AppTextStyleHelper.font62WhiteExtraBold,
            ),
          ),
          Expanded(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 38),
              decoration: const BoxDecoration(
                color: AppColorHelper.whiteColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(24),
                  topRight: Radius.circular(24),
                ),
              ),
              child: SingleChildScrollView(
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
                    const CustomRegistrationInputField(
                      isPassword: false,
                      showPassword: false,
                      title: 'Email',
                      hint: 'Enter your email',
                      titleIcon: FontAwesomeIcons.envelope,
                    ),
                    const SizedBox(height: 20,),
                    CustomRegistrationInputField(
                      isPassword: true,
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
                      onTap: (){},
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
