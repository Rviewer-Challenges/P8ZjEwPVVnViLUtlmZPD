import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';

abstract class Item {
  final String id;
  final String name;
  final String? description;
  final String imageURL;
  final List<IngredientModel> ingredients;
  final double price;

  Item(this.id, this.name, this.description, this.imageURL, this.ingredients, this.price);

  Item.fromJson(this.id, this.name, this.description, this.imageURL, this.ingredients, this.price);
  Map<String, dynamic> toJson();
}