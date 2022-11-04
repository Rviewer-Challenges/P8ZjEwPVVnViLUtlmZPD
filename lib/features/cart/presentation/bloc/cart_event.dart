part of 'cart_bloc.dart';

abstract class CartEvent extends Equatable {
  const CartEvent();
}

class AddItemToCartEvent extends CartEvent {
  final Item item;

  const AddItemToCartEvent(this.item);

  @override
  List<Object> get props => [item];
}

class LoadCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}

class GetCartEvent extends CartEvent {
  @override
  List<Object> get props => [];
}
