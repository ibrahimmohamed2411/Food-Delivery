import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:food_delivery/config/routes/app_routes.dart';
import 'package:food_delivery/features/user/presentation/bloc/user_bloc.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_icon_elevated_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/password_form_field.dart';

class SignInScreen extends StatelessWidget {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 50, 10, 0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Sign In',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context)
                          .pushNamed(AppRoutes.forgetPasswordScreen);
                    },
                    child: Text(
                      'Forget Password?',
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ),
                ),
                CustomCard(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          label: 'Email',
                          controller: emailController,
                          validator: emailValidator,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        PasswordFormField(
                          controller: passwordController,
                          validator: passwordValidator,
                        ),
                      ],
                    ),
                  ),
                ),
                CustomElevatedButton(
                  label: 'Sign In',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      BlocProvider.of<UserBloc>(context).add(
                        SignInEvent(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                    }
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don\'t have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushNamed(AppRoutes.signUpScreen);
                      },
                      child: Text(
                        'Sign Up',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                ),
                CustomIconElevatedButton(
                  label: 'Sign In with Google',
                  icon: FontAwesomeIcons.google,
                  backgroundColor: Color.fromARGB(255, 70, 67, 67),
                  onPressed: () {
                    BlocProvider.of<UserBloc>(context).add(
                      LogInWithGoogleEvent(),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
