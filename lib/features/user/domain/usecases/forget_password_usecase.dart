// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/features/user/domain/repositories/user_repository.dart';

import '../../../../core/usecases/usecase.dart';

class ForgetPasswordUsecase implements UseCase<String, EmailParams> {
  final UserRepository userRepository;
  ForgetPasswordUsecase({
    required this.userRepository,
  });
  @override
  Future<Either<Failure, String>> call(EmailParams params) async {
    return await userRepository.resetPassword(email: params.email);
  }
}

class EmailParams extends Equatable {
  final String email;
  EmailParams({required this.email});
  @override
  List<Object> get props => [email];
}
