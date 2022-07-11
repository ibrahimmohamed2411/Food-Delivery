import '../../../../core/error/failures.dart';
import 'package:dartz/dartz.dart';
import '../../../../core/usecases/usecase.dart';

import '../entities/cart.dart';
import '../repositories/cart_repository.dart';

class GetCartItemsUseCase implements UseCase<List<Cart>, NoParams> {
  final CartRepository repository;
  GetCartItemsUseCase({required this.repository});

  @override
  Future<Either<Failure, List<Cart>>> call(NoParams params) async {
    return await repository.getCartItems();
  }
}
