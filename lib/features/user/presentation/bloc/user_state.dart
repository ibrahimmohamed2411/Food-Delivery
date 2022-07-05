part of 'user_bloc.dart';

abstract class UserState extends Equatable {
  const UserState();

  @override
  List<Object> get props => [];
}

class UserInitial extends UserState {}

class AuthenticationLoadingState extends UserState {}

class AuthenticationErrorState extends UserState {
  final String msg;
  AuthenticationErrorState({
    required this.msg,
  });
  List<Object> get props => [msg];
}

class AuthenticationSuccessState extends UserState {
  List<Object> get props => [];
}

class ForgetPasswordSuccessState extends UserState {
  final String message;
  ForgetPasswordSuccessState({
    required this.message,
  });
  List<Object> get props => [message];
}
