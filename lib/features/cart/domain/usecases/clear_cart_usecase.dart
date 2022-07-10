// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class ClearCartUseCase implements UseCase<Unit, NoParams> {
  final CartRepository cartRepository;
  ClearCartUseCase({
    required this.cartRepository,
  });
  @override
  Future<Either<Failure, Unit>> call(NoParams params) async {
    return await cartRepository.clearCart();
  }
}
