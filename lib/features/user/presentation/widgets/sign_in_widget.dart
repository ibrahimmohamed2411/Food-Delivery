import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/app_colors.dart';

import '../../../../config/routes/app_routes.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/password_form_field.dart';
import '../bloc/user_bloc.dart';

class SignInWidget extends StatelessWidget {
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  SignInWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.fromLTRB(35, 40, 35, 10),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomFormField(
                label: 'Email',
                controller: emailController,
                validator: emailValidator,
              ),
              SizedBox(
                height: 30,
              ),
              PasswordFormField(
                controller: passwordController,
                validator: passwordValidator,
              ),
              SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context)
                      .pushNamed(AppRoutes.forgetPasswordScreen);
                },
                child: Text(
                  'Forget Password?',
                  style: TextStyle(
                    color: AppColors.importantColor,
                    fontSize: 15,
                  ),
                ),
              ),
              Spacer(),
              CustomElevatedButton(
                label: 'Login',
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
            ],
          ),
        ),
      ),
    );
  }
}
