import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/user/domain/usecases/forget_password_usecase.dart';
import 'package:food_delivery/features/user/domain/usecases/log_in_usecase.dart';

import '../../domain/usecases/log_in_with_google.dart';
import '../../domain/usecases/sign_up_usecase.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final LogInUseCase logInUseCase;
  final ForgetPasswordUsecase forgetPasswordUsecase;
  final LogInWithGoogleUseCase logInWithGoogleUseCase;
  final SignUpUseCase signUpUseCase;
  UserBloc({
    required this.logInUseCase,
    required this.forgetPasswordUsecase,
    required this.logInWithGoogleUseCase,
    required this.signUpUseCase,
  }) : super(UserInitial()) {
    on<SignInEvent>((event, emit) async {
      emit(AuthenticationLoadingState());

      final logInSuccessOrFailure = await logInUseCase(LogInParams(
        email: event.email,
        password: event.password,
      ));
      logInSuccessOrFailure.fold(
        (failure) => emit(AuthenticationErrorState(msg: failure.msg)),
        (_) => emit(AuthenticationSuccessState()),
      );
    });
    on<ForgetPasswordEvent>((event, emit) async {
      emit(AuthenticationLoadingState());

      final successOrFailure =
          await forgetPasswordUsecase(EmailParams(email: event.email));
      emit(successOrFailure.fold(
        (failure) => AuthenticationErrorState(msg: failure.msg),
        (message) => ForgetPasswordSuccessState(message: message),
      ));
    });

    on<LogInWithGoogleEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      final successOrFailure = await logInWithGoogleUseCase(NoParams());
      successOrFailure.fold(
        (failure) => emit(AuthenticationErrorState(msg: failure.msg)),
        (_) => emit(AuthenticationSuccessState()),
      );
    });
    on<SignUpEvent>((event, emit) async {
      emit(AuthenticationLoadingState());
      final successOrFailure = await signUpUseCase(
        SignUpParams(
          firstName: event.firstName,
          email: event.email,
          password: event.password,
          lastName: event.lastName,
        ),
      );
      successOrFailure.fold(
        (failure) => emit(AuthenticationErrorState(msg: failure.msg)),
        (message) => emit(AuthenticationSuccessState()),
      );
    });
  }
}
