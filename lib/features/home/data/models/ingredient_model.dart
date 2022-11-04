import 'package:buon_appetito/features/home/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  const IngredientModel({
    required int id,
    required String name,
  }) : super(
          id: id,
          name: name,
        );

  factory IngredientModel.fromJson(Map<dynamic, dynamic> json) {
    return IngredientModel(
      id: json["id"],
      name: json["name"],
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
