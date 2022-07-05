// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/user/domain/repositories/user_repository.dart';

class LogInWithGoogleUseCase implements UseCase<Unit, NoParams> {
  final UserRepository userRepository;
  LogInWithGoogleUseCase({
    required this.userRepository,
  });
  @override
  Future<Either<Failure, Unit>> call(NoParams params)async {
    return await userRepository.signInWithGoogle();
  }
}
