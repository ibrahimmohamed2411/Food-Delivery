// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';

import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/core/usecases/usecase.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';
import 'package:food_delivery/features/cart/domain/usecases/add_cart_item_usecase.dart';

class UpdateCartItemUseCase implements UseCase<Unit, CartParams> {
  final CartRepository cartRepository;
  UpdateCartItemUseCase({
    required this.cartRepository,
  });
  
  @override
  Future<Either<Failure, Unit>> call(CartParams params) async{
    return await cartRepository.updateCartItem(params.cartItem);
  }
}
