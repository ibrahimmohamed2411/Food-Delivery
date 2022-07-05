// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/user/domain/repositories/user_repository.dart';

class SignUpUseCase implements UseCase<String, SignUpParams> {
  final UserRepository userRepository;
  SignUpUseCase({
    required this.userRepository,
  });
  @override
  Future<Either<Failure, String>> call(SignUpParams params) async {
    return userRepository.signUp(
      email: params.email,
      password: params.password,
      lastName: params.lastName,
      firstName: params.firstName,
    );
  }
}

class SignUpParams extends Equatable {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  SignUpParams({
    required this.firstName,
    required this.lastName,
    required this.email,
    required this.password,
  });
  @override
  List<Object> get props => [firstName, lastName, email, password];
}
