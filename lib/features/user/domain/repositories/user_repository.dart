import 'package:dartz/dartz.dart';
import 'package:food_delivery/core/error/failures.dart';

abstract class UserRepository {
  Future<Either<Failure, Unit>> logIn(
      {required String email, required String password});
  Future<Either<Failure, Unit>> registerUser(
      {required String email,
      required String password,
      required String location,
      required String name});
  Future<Either<Failure, Unit>> logInWithGoogle();
  Future<Either<Failure, String>> resetPassword({required String email});
  Future<Either<Failure, Unit>> signInWithGoogle();

  Future<Either<Failure, String>> signUp({
    required String email,
    required String password,
    required String lastName,
    required String firstName,
  });
}
