import 'package:buon_appetito/core/models/item.dart';
import 'package:equatable/equatable.dart';

class Cart extends Equatable {
  final List<Item> items;

  const Cart({
    required this.items,
  });

  @override
  List<Object?> get props => [
        items,
      ];
}
