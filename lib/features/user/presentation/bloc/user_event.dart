part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class SignInEvent extends UserEvent {
  final String email;
  final String password;

  SignInEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class ForgetPasswordEvent extends UserEvent {
  final String email;

  ForgetPasswordEvent({required this.email});

  @override
  List<Object> get props => [email];
}

class LogInWithGoogleEvent extends UserEvent {
  @override
  List<Object> get props => [];
}

class SignUpEvent extends UserEvent {
  final String firstName;
  final String lastName;
  final String email;
  final String password;

  SignUpEvent(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password});

  @override
  List<Object> get props => [firstName, lastName, email, password];
}
