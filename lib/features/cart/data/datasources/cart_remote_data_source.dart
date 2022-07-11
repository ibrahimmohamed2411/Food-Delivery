// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:food_delivery/features/cart/data/models/cart_model.dart';

abstract class CartRemoteDataSource {
  Future<List<CartModel>> getCartItems();
  Future<Unit> addCartItem({required CartModel cartModel});
  Future<Unit> updateCartItem({required CartModel cartModel});
  Future<Unit> removeCartItem({required CartModel cartModel});
  Future<Unit> clearCart();
}

class CartRemoteDataSourceImp implements CartRemoteDataSource {
  final FirebaseFirestore firestore;
  final FirebaseAuth firebaseAuth;
  CartRemoteDataSourceImp({
    required this.firestore,
    required this.firebaseAuth,
  });
  @override
  Future<List<CartModel>> getCartItems() async {
    final cartProducts = await firestore
        .collection('cart')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cartItems')
        .get();
    return cartProducts.docs
        .map((cartItem) => CartModel.fromJson(cartItem.data()))
        .toList();
  }

  @override
  Future<Unit> addCartItem({required CartModel cartModel}) async {
    await firestore
        .collection('cart')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cartItems')
        .doc(cartModel.productId)
        .set(cartModel.toJson());
    return Future.value(unit);
  }

  @override
  Future<Unit> updateCartItem({required CartModel cartModel}) async {
    await firestore
        .collection('cart')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cartItems')
        .doc(cartModel.productId)
        .update(
      {
        'quantity': cartModel.quantity,
      },
    );
    return Future.value(unit);
  }

  @override
  Future<Unit> removeCartItem({required CartModel cartModel}) async{
    await firestore
        .collection('cart')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cartItems')
        .doc(cartModel.productId)
        .delete();
    return Future.value(unit);
  }

  @override
  Future<Unit> clearCart() async{
    final batch = firestore.batch();
    final snapshots =  await firestore
        .collection('cart')
        .doc(firebaseAuth.currentUser!.uid)
        .collection('cartItems').get();
    
    for (var doc in snapshots.docs) {
      batch.delete(doc.reference);
    }
    await batch.commit();
    return Future.value(unit);
  }
}
