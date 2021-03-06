import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'features/cart/data/datasources/cart_remote_data_source.dart';
import 'features/cart/data/repositories/cart_repository_imp.dart';
import 'features/cart/domain/repositories/cart_repository.dart';
import 'features/cart/domain/usecases/add_cart_item_usecase.dart';
import 'features/cart/domain/usecases/clear_cart_usecase.dart';
import 'features/cart/domain/usecases/get_cart_items_usecase.dart';
import 'features/cart/domain/usecases/remove_cart_item_usecase.dart';
import 'features/cart/domain/usecases/update_cart_item_usecase.dart';
import 'features/cart/presentation/cubit/cart_cubit.dart';
import 'features/orders/domain/repositories/order_repository.dart';
import 'features/orders/domain/usecases/get_orders_usecase.dart';
import 'features/orders/domain/usecases/make_order_usecase.dart';
import 'features/orders/presentation/cubit/orders_cubit.dart';
import 'features/products/data/datasources/products_remote_data_source.dart';
import 'features/products/data/repositories/products_repository_imp.dart';
import 'features/products/domain/repositories/products_repository.dart';
import 'features/products/domain/usecases/get_all_products_usecase.dart';
import 'features/products/presentation/cubit/products_cubit.dart';
import 'features/user/data/datasources/user_local_data_source.dart';
import 'features/user/data/datasources/user_remote_data_source.dart';
import 'features/user/data/repositories/user_repository_imp.dart';
import 'features/user/domain/repositories/user_repository.dart';
import 'features/user/domain/usecases/forget_password_usecase.dart';
import 'features/user/domain/usecases/log_in_usecase.dart';
import 'features/user/domain/usecases/log_in_with_google.dart';
import 'features/user/domain/usecases/sign_up_usecase.dart';
import 'features/user/presentation/bloc/user_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'features/orders/data/datasources/orders_remote_data_source.dart';
import 'features/orders/data/repositories/order_repository_imp.dart';

final sl = GetIt.instance;
Future<void> init() async {
  //!Features
  //Blocs

  sl.registerFactory(() => UserBloc(
      logInUseCase: sl(),
      forgetPasswordUsecase: sl(),
      logInWithGoogleUseCase: sl(),
      signUpUseCase: sl()));
  sl.registerFactory(() => ProductsCubit(getAllProductsUseCase: sl()));
  sl.registerFactory(() => CartCubit(
        getCartItemsUseCase: sl(),
        addCartItemUseCase: sl(),
        updateCartItemUseCase: sl(),
        removeCartItemUseCase: sl(),
        clearCartUseCase: sl(),
      ));
  sl.registerFactory(
      () => OrdersCubit(getOrdersUseCase: sl(), makeOrderUseCase: sl()));
  //usecases
  sl.registerLazySingleton(() => LogInUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => ForgetPasswordUsecase(userRepository: sl()));
  sl.registerLazySingleton(() => LogInWithGoogleUseCase(userRepository: sl()));
  sl.registerLazySingleton(() => SignUpUseCase(userRepository: sl()));
  sl.registerLazySingleton(
      () => GetAllProductsUseCase(productsRepository: sl()));
  sl.registerLazySingleton(() => AddCartItemUseCase(cartRepository: sl()));
  sl.registerLazySingleton(() => UpdateCartItemUseCase(cartRepository: sl()));
  sl.registerLazySingleton(() => GetCartItemsUseCase(repository: sl()));
  sl.registerLazySingleton(() => RemoveCartItemUseCase(cartRepository: sl()));
  sl.registerLazySingleton(() => GetOrdersUseCase(orderRepository: sl()));
  sl.registerLazySingleton(() => MakeOrderUseCase(orderRepository: sl()));
  sl.registerLazySingleton(() => ClearCartUseCase(cartRepository: sl()));
  //repositories
  sl.registerLazySingleton<UserRepository>(
      () => UserRepositoryImp(userRemoteDataSource: sl()));
  sl.registerLazySingleton<ProductsRepository>(
      () => ProductsRepositoryImp(productsRemoteDataSource: sl()));
  sl.registerLazySingleton<CartRepository>(
      () => CartRepositoryImp(cartRemoteDataSource: sl()));
  sl.registerLazySingleton<OrderRepository>(
      () => OrderRepositoryImp(orderRemoteDataSource: sl()));
  //data sources
  sl.registerLazySingleton<UserRemoteDataSource>(() => UserRemoteDataSourceImpl(
      firebaseAuth: sl(), googleSignIn: sl(), firestore: sl()));
  sl.registerLazySingleton<UserLocalDataSource>(
      () => UserLocalDataSourceImp(firebaseAuth: sl(), googleSignIn: sl()));
  sl.registerLazySingleton<ProductsRemoteDataSource>(
      () => ProductsRemoteDataSourceImpl(firestore: sl()));
  sl.registerLazySingleton<CartRemoteDataSource>(
      () => CartRemoteDataSourceImp(firestore: sl(), firebaseAuth: sl()));
  sl.registerLazySingleton<OrderRemoteDataSource>(
      () => OrderRemoteDataSourceImp(firestore: sl(), firebaseAuth: sl()));
  //!core

  //!externals
  final firebaseAuth = FirebaseAuth.instance;
  sl.registerLazySingleton(() => firebaseAuth);
  sl.registerLazySingleton(() => GoogleSignIn());
  sl.registerLazySingleton(() => FirebaseFirestore.instance);
}
