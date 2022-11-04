import 'package:buon_appetito/core/utils/text_utils.dart';
import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:buon_appetito/features/home/data/models/pizza_halve_model.dart';
import 'package:buon_appetito/features/home/domain/entities/pizza.dart';

class PizzaModel extends Pizza {
  const PizzaModel({
    required String id,
    required String name,
    required String? description,
    required String imageURL,
    required List<IngredientModel> ingredients,
    required double price,
    required List<PizzaHalveModel> halves,
  }) : super(
          id: id,
          name: name,
          description: description,
          imageURL: imageURL,
          ingredients: ingredients,
          price: price,
          halves: halves,
        );

  factory PizzaModel.fromJson(Map<dynamic, dynamic> json) {
    final List<IngredientModel> ingredients = [];
    final List<dynamic> jsonIngredients = json["ingredients"];
    final List<PizzaHalveModel> halves = [];
    final List<dynamic> jsonHalves = json["halves"] ?? [];

    for (var ingredient in jsonIngredients) {
      ingredients.add(IngredientModel.fromJson(ingredient));
    }

    for (var halve in jsonHalves) {
      halves.add(PizzaHalveModel.fromJson(halve));
    }

    return PizzaModel(
      id: json["id"] != null ? json["id"].toString() : '',
      name: json["name"] ?? "",
      description: json["description"] ?? "",
      imageURL: json["image"] ?? "",
      ingredients: ingredients,
      price: json["price"] != null ? double.parse(json["price"].toString()) : 0.0,
      halves: halves,
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

    if (isEmpty(jsonPizza["halves"]) || jsonPizza["halves"].isEmpty) {
      jsonPizza["halves"] = [PizzaHalveModel(id: 1, ingredients: listIngredients)];
    }

    return PizzaModel(
      id: jsonPizza["id"] != null ? jsonPizza["id"].toString() : '',
      name: jsonPizza["name"] ?? "",
      description: jsonPizza["description"] ?? "",
      imageURL: jsonPizza["image"] ?? "",
      ingredients: jsonPizza["ingredients"] ?? [],
      price: jsonPizza["price"] != null ? double.parse(jsonPizza["price"].toString()) : 0.0,
      halves: jsonPizza["halves"] ?? [],
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
    return 'PizzaModel{halves: $halves, id: $id, name: $name, description: $description, imageURL: $imageURL, ingredients: $ingredients, price: $price}';
  }
}
