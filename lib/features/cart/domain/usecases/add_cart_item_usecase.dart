import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/core/error/failures.dart';

import '../../../../core/usecases/usecase.dart';
import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class AddCartItemUseCase implements UseCase<Unit, CartParams> {
  final CartRepository cartRepository;

  AddCartItemUseCase({required this.cartRepository});

  @override
  Future<Either<Failure, Unit>> call(CartParams params) async {
    return await cartRepository.addCartItem(params.cartItem);
  }
}

class CartParams extends Equatable {
  final Cart cartItem;

  CartParams({required this.cartItem});
  @override
  List<Object> get props => [cartItem];
}
