import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:equatable/equatable.dart';

class PizzaHalve extends Equatable {
  final int id;
  final List<IngredientModel> ingredients;

  const PizzaHalve({
    required this.id,
    required this.ingredients,
  });

  @override
  List<Object?> get props => [
        id,
        ingredients,
      ];
}
