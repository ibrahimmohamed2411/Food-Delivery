import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:food_delivery/features/cart/data/datasources/cart_remote_data_source.dart';
import 'package:food_delivery/features/cart/data/models/cart_model.dart';
import 'package:food_delivery/features/cart/domain/entities/cart.dart';
import 'package:food_delivery/core/error/failures.dart';
import 'package:dartz/dartz.dart';
import 'package:food_delivery/features/cart/domain/repositories/cart_repository.dart';

class CartRepositoryImp implements CartRepository {
  final CartRemoteDataSource cartRemoteDataSource;
  CartRepositoryImp({required this.cartRemoteDataSource});
  @override
  Future<Either<Failure, List<Cart>>> getCartItems() async {
    try {
      final cartItems = await cartRemoteDataSource.getCartItems();
      return Right(cartItems);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> addCartItem(Cart cartItem) async {
    try {
      final CartModel cartModel = CartModel(
          title: cartItem.title,
          price: cartItem.price,
          productId: cartItem.productId,
          quantity: cartItem.quantity,
          imageUrl: cartItem.imageUrl);
      await cartRemoteDataSource.addCartItem(cartModel: cartModel);
      return Right(unit);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> updateCartItem(Cart cartItem) async {
    try {
      final cartModel = CartModel(
        title: cartItem.title,
        price: cartItem.price,
        productId: cartItem.productId,
        quantity: cartItem.quantity,
        imageUrl: cartItem.imageUrl,
      );
      await cartRemoteDataSource.updateCartItem(cartModel: cartModel);
      return Right(unit);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> removeCartItem(Cart cartItem) async {
    try {
      final cartModel = CartModel(
        title: cartItem.title,
        price: cartItem.price,
        productId: cartItem.productId,
        quantity: cartItem.quantity,
        imageUrl: cartItem.imageUrl,
      );
      await cartRemoteDataSource.removeCartItem(cartModel: cartModel);
      return Right(unit);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }

  @override
  Future<Either<Failure, Unit>> clearCart() async{
    try {
      await cartRemoteDataSource.clearCart();
      return Right(unit);
    } on FirebaseException catch (error) {
      return Left(ServerFailure(msg: error.message!));
    }
  }
}
