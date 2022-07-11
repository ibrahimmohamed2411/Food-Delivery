import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../core/error/failures.dart';
import '../datasources/user_remote_data_source.dart';

import '../../domain/repositories/user_repository.dart';

class UserRepositoryImp implements UserRepository {
  final UserRemoteDataSource userRemoteDataSource;
  UserRepositoryImp({
    required this.userRemoteDataSource,
  });

  @override
  Future<Either<Failure, Unit>> logIn(
      {required String email, required String password}) async {
    try {
      await userRemoteDataSource.logIn(email: email, password: password);
      return Right(unit);
    } on FirebaseAuthException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> logInWithGoogle() {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, Unit>> registerUser(
      {required String email,
      required String password,
      required String location,
      required String name}) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, String>> resetPassword({required String email}) async {
    try {
      final message = await userRemoteDataSource.resetPassword(email: email);
      return Right(message);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(msg: e.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> signInWithGoogle() async {
    try {
      await userRemoteDataSource.signInWithGoogle();
      return Right(unit);
    } on FirebaseAuthException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }

  @override
  Future<Either<Failure, String>> signUp(
      {required String email,
      required String password,
      required String lastName,
      required String firstName}) async {
    try {
      final message = await userRemoteDataSource.signUp(
        email: email,
        password: password,
        lastName: lastName,
        firstName: firstName,
      );
      return Right(message);
    } on FirebaseAuthException catch (e) {
      return Left(ServerFailure(msg: e.message!));
    }
  }
}
