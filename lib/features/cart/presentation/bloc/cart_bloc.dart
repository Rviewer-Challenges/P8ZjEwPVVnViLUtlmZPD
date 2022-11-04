import 'package:bloc/bloc.dart';
import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/features/cart/data/models/cart_model.dart';
import 'package:buon_appetito/features/cart/domain/entities/cart.dart';
import 'package:buon_appetito/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:buon_appetito/features/cart/domain/use_cases/load_items_cart.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'cart_event.dart';

part 'cart_state.dart';

class CartBloc extends Bloc<CartEvent, CartState> {
  final AddToCart addToCart;
  final LoadItemsCart loadItemsCart;

  CartModel cart = const CartModel(items: []);

  CartBloc({
    required this.addToCart,
    required this.loadItemsCart,
  }) : super(CartInitial()) {
    on<CartEvent>((event, emit) {});
    on<LoadCartEvent>(onLoadCartEvent);
    on<GetCartEvent>(onGetCartEvent);
    on<AddItemToCartEvent>(onAddItemToCartEvent);
  }

  dynamic onLoadCartEvent(event, emit) async {
    emit(Loading());
    try {
      final response = await loadItemsCart(const LoadItemsCartParams());
      cart = response;
      emit(LoadCartSuccess(response));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(Error(e.toString()));
    }
  }

  dynamic onGetCartEvent(event, emit) async {
    emit(Loading());
    try {
      emit(GetCartSuccess(cart));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(Error(e.toString()));
    }
  }

  dynamic onAddItemToCartEvent(event, emit) async {
    emit(Loading());
    try {
      final response = await addToCart(AddToCartParams(event.item));
      cart.items.add(event.item);
      emit(AddItemToCartSuccess(response));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(const AddItemToCartSuccess(false));
    }
  }
}
