import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../../core/utils/validators.dart';
import '../../../../core/widgets/custom_card.dart';
import '../../../../core/widgets/custom_elevated_button.dart';
import '../../../../core/widgets/custom_form_field.dart';
import '../../../../core/widgets/custom_icon_elevated_button.dart';
import '../../../../core/widgets/password_form_field.dart';
import '../bloc/user_bloc.dart';

class SignUpScreen extends StatelessWidget {
  SignUpScreen({Key? key}) : super(key: key);
  final firstNameController = TextEditingController();
  final lastNameController = TextEditingController();
  final passwordController = TextEditingController();
  final emailController = TextEditingController();
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
                BlocListener<UserBloc, UserState>(
                  listener: (context, state) {
                    if (state is AuthenticationSuccessState) {
                      Navigator.of(context).pop();
                    }
                  },
                  child: SizedBox(),
                ),
                Text(
                  'Sign Up',
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(
                  height: 40,
                ),
                CustomCard(
                  padding: EdgeInsets.all(30),
                  child: Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomFormField(
                          label: 'First Name',
                          controller: firstNameController,
                          validator: nameValidator,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          label: 'Last Name',
                          controller: lastNameController,
                          validator: nameValidator,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        CustomFormField(
                          controller: emailController,
                          label: 'Email',
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
                  label: 'Sign Up',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Don you have an account? ',
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: Text(
                        'Sign In',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                  ],
                ),
                Divider(
                  color: Colors.grey,
                  height: 10,
                ),
                CustomIconElevatedButton(
                  backgroundColor: Colors.white,
                  borderColor: Colors.black,
                  labelColor: Colors.black,
                  icon: FontAwesomeIcons.google,
                  label: 'Sign Up With Google',
                  onPressed: () {
                    BlocProvider.of<UserBloc>(context)
                        .add(LogInWithGoogleEvent());
                  },
                  iconColor: Colors.black,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
