import 'package:dartz/dartz.dart';
import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/features/products/domain/entities/products.dart';

abstract class ProductsRepository{
  Future<Either<Failure,Products>> getAllProducts();
}