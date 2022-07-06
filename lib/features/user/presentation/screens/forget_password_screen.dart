import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery/core/utils/validators.dart';
import 'package:food_delivery/core/widgets/custom_card.dart';
import 'package:food_delivery/core/widgets/custom_elevated_button.dart';
import 'package:food_delivery/core/widgets/custom_form_field.dart';

import '../bloc/user_bloc.dart';

class ForgetPasswordScreen extends StatelessWidget {
  final emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  ForgetPasswordScreen({Key? key}) : super(key: key);

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
                  'Forget \nPassword?',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 50,
                ),
                CustomCard(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: CustomFormField(
                      controller: emailController,
                      label: 'Email',
                      validator: emailValidator,
                    ),
                  ),
                ),
                CustomElevatedButton(
                  label: 'Send',
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      FocusScope.of(context).unfocus();
                      BlocProvider.of<UserBloc>(context).add(
                        ForgetPasswordEvent(email: emailController.text),
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
