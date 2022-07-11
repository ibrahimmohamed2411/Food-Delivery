import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import '../../domain/usecases/add_cart_item_usecase.dart';
import '../../domain/usecases/clear_cart_usecase.dart';
import '../../domain/usecases/get_cart_items_usecase.dart';
import '../../domain/usecases/update_cart_item_usecase.dart';

import '../../../../core/usecases/usecase.dart';
import '../../../products/domain/entities/products.dart';
import '../../domain/entities/cart.dart';
import '../../domain/usecases/remove_cart_item_usecase.dart';

part 'cart_state.dart';

extension on List<Cart> {
  int getItem(Cart cartItem) {
    return indexWhere((element) => element.productId == cartItem.productId);
  }
}

class CartCubit extends Cubit<CartState> {
  final GetCartItemsUseCase getCartItemsUseCase;
  final AddCartItemUseCase addCartItemUseCase;
  final UpdateCartItemUseCase updateCartItemUseCase;
  final RemoveCartItemUseCase removeCartItemUseCase;
  final ClearCartUseCase clearCartUseCase;
  CartCubit({
    required this.getCartItemsUseCase,
    required this.addCartItemUseCase,
    required this.updateCartItemUseCase,
    required this.removeCartItemUseCase,
    required this.clearCartUseCase,
  }) : super(CartInitial());
  Future<void> getCartItems() async {
    emit(CartLoadingState());
    final cartItemsOrFailure = await getCartItemsUseCase(NoParams());
    emit(
      cartItemsOrFailure.fold(
        (failure) => CartErrorState(msg: failure.msg),
        (cartItems) => CartLoadedState(cartItems: cartItems),
      ),
    );
  }

  Future<void> addItem(Product product, int quantity) async {
    List<Cart> cartItems =
        List<Cart>.from((state as CartLoadedState).cartItems);
    final cartItem = Cart(
      imageUrl: product.imageUrl,
      title: product.title,
      price: product.price,
      productId: product.id,
      quantity: quantity,
    );
    int index = cartItems.getItem(cartItem);

    if (index == -1) {
      final addCartItemSuccessOrFailure =
          await addCartItemUseCase(CartParams(cartItem: cartItem));
      emit(
        addCartItemSuccessOrFailure.fold(
          (failure) => CartErrorState(msg: failure.msg),
          (success) {
            cartItems.add(cartItem);
            return CartLoadedState(cartItems: cartItems);
          },
        ),
      );
    } else {
      cartItem.quantity += cartItems[index].quantity;
      final updateCartItemSuccessOrFailure =
          await updateCartItemUseCase(CartParams(cartItem: cartItem));
      emit(
        updateCartItemSuccessOrFailure.fold(
          (failure) {
            cartItem.quantity -= cartItems[index].quantity;
            return CartErrorState(msg: failure.msg);
          },
          (success) {
            cartItems[index] = cartItem;

            return CartLoadedState(cartItems: cartItems);
          },
        ),
      );
    }
  }

  Future<void> incrementCartItemQuantity(Cart cartItem) async {
    List<Cart> cartItems =
        List<Cart>.from((state as CartLoadedState).cartItems);
    int index = cartItems.getItem(cartItem);
    cartItem.quantity++;
    final updateCartItemSuccessOrFailure =
        await updateCartItemUseCase(CartParams(cartItem: cartItem));
    emit(
      updateCartItemSuccessOrFailure.fold(
        (failure) {
          cartItem.quantity -= 1;
          return CartErrorState(msg: failure.msg);
        },
        (success) {
          cartItems[index] = cartItem;

          return CartLoadedState(cartItems: cartItems);
        },
      ),
    );
  }

  Future<void> decrementCartItemQuantity(Cart cartItem) async {
    if (cartItem.quantity > 1) {
      List<Cart> cartItems =
          List<Cart>.from((state as CartLoadedState).cartItems);
      int index = cartItems.getItem(cartItem);
      cartItem.quantity--;
      final updateCartItemSuccessOrFailure =
          await updateCartItemUseCase(CartParams(cartItem: cartItem));
      emit(
        updateCartItemSuccessOrFailure.fold(
          (failure) {
            cartItem.quantity++;
            return CartErrorState(msg: failure.msg);
          },
          (success) {
            cartItems[index] = cartItem;

            return CartLoadedState(cartItems: cartItems);
          },
        ),
      );
    }
  }

  Future<void> deleteCartItem(Cart cartItem) async {
    List<Cart> cartItems =
        List<Cart>.from((state as CartLoadedState).cartItems);
    final itemRemovedSuccessfullyOrFailure =
        await removeCartItemUseCase(CartParams(cartItem: cartItem));
    emit(
      itemRemovedSuccessfullyOrFailure.fold(
        (failure) => CartErrorState(msg: failure.msg),
        (success) {
          cartItems.remove(cartItem);
          return CartLoadedState(cartItems: cartItems);
        },
      ),
    );
  }

  Future<void> clearCart() async {
    final SuccessOrFailure = await clearCartUseCase(NoParams());
    SuccessOrFailure.fold(
      (failure) => debugPrint('failed to clear cart'),
      (_) => CartLoadedState(cartItems: []),
    );
    emit(CartLoadedState(cartItems: []));
  }
}
