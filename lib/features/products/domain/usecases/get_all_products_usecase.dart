// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/products/domain/entities/products.dart';
import 'package:food_delivery/features/products/domain/repositories/products_repository.dart';

class GetAllProductsUseCase implements UseCase<Products, NoParams> {
  final ProductsRepository productsRepository;
  GetAllProductsUseCase({
    required this.productsRepository,
  });
  @override
  Future<Either<Failure, Products>> call(NoParams params) async{
    return await productsRepository.getAllProducts();
  }
}
