import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/features/cart/data/data_sources/cart_data_source.dart';
import 'package:buon_appetito/features/cart/data/models/cart_model.dart';
import 'package:buon_appetito/features/cart/domain/repositories/cart_repository.dart';
import 'package:flutter/material.dart';

class CartRepositoryImp implements CartRepository {
  final CartDataSource cartDataSource;

  CartRepositoryImp({
    required this.cartDataSource,
  });

  @override
  Future loadItemsCart() async {
    try {
      final items = await cartDataSource.loadItemsCart();
      return CartModel(items: items);
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  @override
  Future addToCart(Item item) async {
    try {
      await cartDataSource.saveItemInCart(item);
      return true;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
