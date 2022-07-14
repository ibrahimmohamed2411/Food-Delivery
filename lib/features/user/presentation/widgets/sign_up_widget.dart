import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/password_form_field.dart';
import '../bloc/user_bloc.dart';

class SignUpWidget extends StatelessWidget {
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.fromLTRB(35, 40, 35, 10),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CustomFormField(
                  label: 'First Name',
                  controller: firstNameController,
                  validator: nameValidator,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  label: 'Last Name',
                  controller: lastNameController,
                  validator: nameValidator,
                ),
                SizedBox(
                  height: 15,
                ),
                CustomFormField(
                  label: 'Email',
                  controller: emailController,
                  validator: emailValidator,
                ),
                SizedBox(
                  height: 15,
                ),
                PasswordFormField(
                  validator: passwordValidator,
                  controller: passwordController,
                ),
                SizedBox(
                  height: 25,
                ),
                // Spacer(),
                CustomElevatedButton(
                  label: 'Register',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      BlocProvider.of<UserBloc>(context).add(
                        SignUpEvent(
                          firstName: firstNameController.text,
                          lastName: lastNameController.text,
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
      ),
    );
  }
}
