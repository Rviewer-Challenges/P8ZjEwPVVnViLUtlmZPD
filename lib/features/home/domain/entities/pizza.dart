import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:buon_appetito/features/home/domain/entities/pizza_halve.dart';
import 'package:equatable/equatable.dart';

class Pizza extends Equatable implements Item {
  final List<PizzaHalve> halves;

  @override
  final String id;
  @override
  final String name;
  @override
  final String? description;
  @override
  final String imageURL;
  @override
  final List<IngredientModel> ingredients;
  @override
  final double price;

  const Pizza({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.ingredients,
    required this.price,
    required this.halves,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageURL,
        ingredients,
        price,
        halves,
      ];

  @override
  String toString() {
    return 'Pizza{halves: $halves, id: $id, name: $name, description: $description, imageURL: $imageURL, ingredients: $ingredients, price: $price}';
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }
}
