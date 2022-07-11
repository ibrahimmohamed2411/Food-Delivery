import 'package:dartz/dartz.dart';
import '../../../../core/error/failures.dart';
import '../entities/cart.dart';

abstract class CartRepository {
  Future<Either<Failure, List<Cart>>> getCartItems();
  Future<Either<Failure, Unit>> addCartItem(Cart cartItem);
   Future<Either<Failure, Unit>> updateCartItem(Cart cartItem);
   Future<Either<Failure,Unit>> removeCartItem(Cart cartItem);
   Future<Either<Failure,Unit>> clearCart();
}
