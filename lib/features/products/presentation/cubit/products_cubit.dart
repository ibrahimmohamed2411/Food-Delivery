import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:food_delivery/features/products/domain/usecases/get_all_products_usecase.dart';

import '../../../../core/usecases/usecase.dart';
import '../../domain/entities/products.dart';

part 'products_state.dart';

class ProductsCubit extends Cubit<ProductsState> {
  final GetAllProductsUseCase getAllProductsUseCase;
  ProductsCubit({required this.getAllProductsUseCase})
      : super(ProductsInitial());

  Future<void> getAllProducts() async {
    emit(ProductsLoadingState());
    final productsSuccessOrFailure = await getAllProductsUseCase(NoParams());
    productsSuccessOrFailure.fold(
      (failure) => emit(ProductsErrorState(msg: failure.msg)),
      (products) => emit(ProductsLoadedState(products: products)),
    );
  }
}
