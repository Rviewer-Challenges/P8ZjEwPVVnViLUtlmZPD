import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:buon_appetito/features/home/domain/entities/pizza.dart';

class PizzaModel extends Pizza {
  const PizzaModel({
    required String id,
    required String name,
    required String? description,
    required String imageURL,
    required List<IngredientModel> ingredients,
    required double price,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageURL: imageURL,
          ingredients: ingredients,
          price: price,
        );

  factory PizzaModel.fromJson(Map<dynamic, dynamic> json) {
    final List<IngredientModel> ingredients = [];
    final List<dynamic> jsonIngredients = json["ingredients"];

    for (var ingredient in jsonIngredients) {
      ingredients.add(IngredientModel.fromJson(ingredient));
    }

    return PizzaModel(
      id: json["id"] != null ? json["id"].toString() : '',
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      imageURL: json["image"] ?? "",
      ingredients: ingredients,
      price: json["price"] != null ? double.parse(json["price"].toString()) : 0.0,
    );
  }

  factory PizzaModel.fromJsonWithIngredients(
    Map<String, dynamic> jsonPizza,
    List<dynamic> jsonIngredients,
  ) {
    List<IngredientModel> listIngredients = [];
    jsonPizza["ingredients"].forEach((ingredientId) {
      final ingredientModel = IngredientModel.fromJson(
        jsonIngredients.firstWhere((element) => element["id"] == ingredientId),
      );
      listIngredients.add(ingredientModel);
    });
    jsonPizza["ingredients"] = listIngredients;

    return PizzaModel(
      id: jsonPizza["id"] != null ? jsonPizza["id"].toString() : '',
      name: jsonPizza["name"] ?? "",
      description: jsonPizza["description"] ?? "",
      imageURL: jsonPizza["image"] ?? "",
      ingredients: jsonPizza["ingredients"] ?? [],
      price: jsonPizza["price"] != null ? double.parse(jsonPizza["price"].toString()) : 0.0,
    );
  }

  @override
  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> jsonIngredients = ingredients.map((ingredient) => ingredient.toJson()).toList();
    return {
      "id": id,
      "name": name,
      "description": description,
      "imageURL": imageURL,
      "ingredients": jsonIngredients,
      "price": price,
    };
  }

  @override
  String toString() {
    return 'PizzaModel{id: $id, name: $name, description: $description, imageURL: $imageURL, ingredients: $ingredients, price: $price}';
  }
}
