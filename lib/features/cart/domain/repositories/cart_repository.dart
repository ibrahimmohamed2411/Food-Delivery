import 'package:dartz/dartz.dart';
import 'package:food_delivery/core/error/failures.dart';
import 'package:food_delivery/features/cart/domain/entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCartItems();
  Future<Either<Failure, Unit>> addCartItem(Cart cartItem);
   Future<Either<Failure, Unit>> updateCartItem(Cart cartItem);
   Future<Either<Failure,Unit>> removeCartItem(Cart cartItem);
   Future<Either<Failure,Unit>> clearCart();
}
