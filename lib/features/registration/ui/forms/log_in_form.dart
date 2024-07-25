import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:marketos/core/components/custom_button.dart';
import 'package:marketos/core/helpers/color_helper.dart';
import 'package:marketos/core/helpers/font_style_helper.dart';
import 'package:marketos/core/routing/routing_constants.dart';
import 'package:marketos/features/registration/ui/registration_view.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_input_field.dart';
import 'package:marketos/features/registration/ui/widgets/custom_registration_text.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({super.key});

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {

  bool passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return RegistrationView(
      title: 'Welcome \nBack',
      registrationForm: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 16,),
          const Text(
            'Log In',
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
          const SizedBox(height: 40,),
          CustomButton(
            text: 'Log In',
            onTap: (){},
            color: AppColorHelper.primaryColor,
            textStyle: AppTextStyleHelper.font26WhiteBold,
          ),
          const SizedBox(height: 20,),
          CustomRegistrationText(
            text: 'Create an account',
            onTap: (){
              Navigator.pushNamed(context, AppRoutingConstants.signIn);
            },
          ),
        ],
      ),
    );
  }
}
