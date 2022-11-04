import 'package:buon_appetito/core/models/item.dart';

abstract class CartRepository {
  Future<dynamic> loadItemsCart();
  Future<dynamic> addToCart(Item item);
}
