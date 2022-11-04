import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/features/cart/domain/entities/cart.dart';

class CartModel extends Cart {
  const CartModel({
    required List<Item> items,
  }) : super(items: items);

  factory CartModel.fromJson(Map<dynamic, dynamic> json) {
    return CartModel(
      items: json["items"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "items": items,
    };
  }

  @override
  String toString() {
    return 'CartModel{items: $items}';
  }
}
