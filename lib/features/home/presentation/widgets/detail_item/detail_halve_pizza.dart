import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/ingredient_item.dart';
import 'package:flutter/cupertino.dart';

class DetailHalvePizza extends StatelessWidget {
  final PizzaModel pizza;

  const DetailHalvePizza({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: pizza.halves.map((halve) {
        return ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (_, index) {
            return IngredientItem(
              ingredient: halve.ingredients[index],
              onChanged: (bool? value) {
                // pizza.ingredients[index].active = value == true;
              },
            );
          },
          itemCount: halve.ingredients.length,
        );
      }).toList(),
    );
  }
}
