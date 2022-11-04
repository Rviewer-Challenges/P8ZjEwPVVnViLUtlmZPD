import 'package:buon_appetito/core/models/use_case.dart';
import 'package:buon_appetito/features/cart/data/models/cart_model.dart';
import 'package:buon_appetito/features/cart/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class LoadItemsCart extends UseCase<CartModel, LoadItemsCartParams> {
  final CartRepository repository;

  LoadItemsCart(this.repository);

  @override
  Future<dynamic> call(LoadItemsCartParams params) async {
    return await repository.loadItemsCart();
  }
}

class LoadItemsCartParams extends Equatable {
  const LoadItemsCartParams();

  @override
  List<Object> get props => [];
}
