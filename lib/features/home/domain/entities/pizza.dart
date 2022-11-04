import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:equatable/equatable.dart';

class Pizza extends Equatable implements Item {
  final String id;
  final String name;
  final String? description;
  final String imageURL;
  final List<IngredientModel> ingredients;
  final double price;

  const Pizza({
    required this.id,
    required this.name,
    required this.description,
    required this.imageURL,
    required this.ingredients,
    required this.price,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        description,
        imageURL,
        ingredients,
        price,
      ];

  @override
  String toString() {
    return 'Pizza{id: $id, name: $name, description: $description, imageURL: $imageURL, ingredients: $ingredients, price: $price}';
  }

  @override
  Map<String, dynamic> toJson() {
    throw UnimplementedError();
  }

}
