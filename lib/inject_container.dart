import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/user/data/datasources/user_local_data_source.dart';
import 'package:food_delivery/features/user/data/datasources/user_remote_data_source.dart';
import 'package:food_delivery/features/user/data/repositories/user_repository_imp.dart';
import 'package:food_delivery/features/user/domain/repositories/user_repository.dart';
import 'package:food_delivery/features/user/domain/usecases/forget_password_usecase.dart';
import 'package:food_delivery/features/user/domain/usecases/log_in_usecase.dart';
import 'package:food_delivery/features/user/domain/usecases/log_in_with_google.dart';
import 'package:food_delivery/features/user/domain/usecases/sign_up_usecase.dart';
import 'package:food_delivery/features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //!Features
  //Blocs

  sl.registerFactory(() => UserBloc(
      logInUseCase: sl(),
      forgetPasswordUsecase: sl(),
      logInWithGoogleUseCase: sl(),
      signUpUseCase: sl()));
  //usecases
  sl.registerLazySingleton(() => LogInUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUsecase(userRepository: sl()));
  sl.registerLazySingleton(() => LogInWithGoogleUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(userRepository: sl()));
  //repositories
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImp(userRemoteDataSource: sl()));
  //data sources
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      firebaseAuth: sl(), googleSignIn: sl(), firestore: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImp(firebaseAuth: sl(), googleSignIn: sl()));
  //!core

  //!externals
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
