// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/products/data/datasources/products_remote_data_source.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/products.dart';
import '../../domain/repositories/products_repository.dart';

class ProductsRepositoryImp implements ProductsRepository {
  final ProductsRemoteDataSource productsRemoteDataSource;
  ProductsRepositoryImp({
    required this.productsRemoteDataSource,
  });
  @override
  Future<Either<Failure, Products>> getAllProducts() async {
    try {
      final products = await productsRemoteDataSource.getAllProducts();
      return Right(products);
    } on FirebaseException catch (e) {
      return Left(ServerFailure(msg: e.message!));
    }
  }
}
