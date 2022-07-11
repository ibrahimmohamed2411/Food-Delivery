import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/products.dart';

abstract class ProductsRepository{
  Future<Either<Failure,Products>> getAllProducts();
}