import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/user/domain/repositories/user_repository.dart';

class LogInUseCase implements UseCase<Unit, LogInParams> {
  final UserRepository userRepository;
  LogInUseCase({
    required this.userRepository,
  });

  @override
  Future<Either<Failure, Unit>> call(LogInParams params) async {
    return await userRepository.logIn(
      email: params.email,
      password: params.password,
    );
  }
}

class LogInParams extends Equatable {
  final String email;
  final String password;
  LogInParams({
    required this.email,
    required this.password,
  });

  @override
  List<Object?> get props => [email, password];
}
