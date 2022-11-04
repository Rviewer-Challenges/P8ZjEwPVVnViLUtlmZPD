import 'package:buon_appetito/features/home/domain/entities/ingredient.dart';

class IngredientModel extends Ingredient {
  const IngredientModel({
    required int id,
    required String name,
    bool active = true,
  }) : super(
          id: id,
          name: name,
          active: active,
        );

  factory IngredientModel.fromJson(Map<dynamic, dynamic> json) {
    return IngredientModel(
      id: json["id"],
      name: json["name"],
      active: json["active"] == true,
    );
  }

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "active": active,
      };
}
