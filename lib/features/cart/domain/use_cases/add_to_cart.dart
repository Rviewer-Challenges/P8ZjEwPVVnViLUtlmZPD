import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/models/use_case.dart';
import 'package:buon_appetito/features/cart/domain/repositories/cart_repository.dart';
import 'package:equatable/equatable.dart';

class AddToCart extends UseCase<Item, AddToCartParams> {
  final CartRepository repository;

  AddToCart(this.repository);

  @override
  Future<dynamic> call(AddToCartParams params) async {
    return await repository.addToCart(params.item);
  }
}

class AddToCartParams extends Equatable {
  final Item item;

  const AddToCartParams(this.item);

  @override
  List<Object> get props => [item];
}
