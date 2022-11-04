part of 'cart_bloc.dart';

abstract class CartState extends Equatable {
  const CartState();
}

class CartInitial extends CartState {
  @override
  List<Object> get props => [];
}

class Loading extends CartState {
  @override
  List<Object> get props => [];
}

class Error extends CartState {
  final String message;

  const Error(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadCartSuccess extends CartState {
  final Cart cart;

  const LoadCartSuccess(this.cart);

  @override
  List<Object> get props => [cart];
}

class GetCartSuccess extends CartState {
  final CartModel cart;

  const GetCartSuccess(this.cart);

  @override
  List<Object> get props => [cart];
}

class AddItemToCartSuccess extends CartState {
  final bool added;

  const AddItemToCartSuccess(this.added);

  @override
  List<Object?> get props => [added];
}
