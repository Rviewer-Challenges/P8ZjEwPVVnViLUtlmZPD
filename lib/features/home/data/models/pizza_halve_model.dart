import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:buon_appetito/features/home/domain/entities/pizza_halve.dart';

class PizzaHalveModel extends PizzaHalve {
  PizzaHalveModel({
    id,
    required ingredients,
  }) : super(
          id: DateTime.now().millisecondsSinceEpoch,
          ingredients: ingredients,
        );

  factory PizzaHalveModel.fromJson(Map<dynamic, dynamic> json) {
    final List<IngredientModel> ingredients = [];
    final List<dynamic> jsonIngredients = json["ingredients"];

    for (var ingredient in jsonIngredients) {
      ingredients.add(IngredientModel.fromJson(ingredient));
    }
    return PizzaHalveModel(
      id: json["id"],
      ingredients: ingredients,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "ingredients": ingredients,
      };

  @override
  List<Object?> get props => [
        id,
        ingredients,
      ];
}
