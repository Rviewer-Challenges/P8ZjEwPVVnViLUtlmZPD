import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/ingredient_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DetailHalvePizza extends StatelessWidget {
  final PizzaModel pizza;

  const DetailHalvePizza({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    int halveCount = 0;

    return Column(
      children: pizza.halves.map((halve) {
        halveCount++;
        return Container(
          decoration: BoxDecoration(
            border: Border.all(color: borderColor),
            borderRadius: BorderRadius.circular(10),
          ),
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          margin: const EdgeInsets.only(top: 16, bottom: 8),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8, bottom: 4),
                child: Text(
                  AppLocalizations.of(context)!.halveCount.toString().replaceFirst('\$index', halveCount.toString()),
                  style: const TextStyle(
                    color: greyTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 4),
                child: Text(
                  AppLocalizations.of(context)!.ingredients,
                  style: const TextStyle(
                    color: greyTextColor,
                    fontSize: 18,
                  ),
                ),
              ),
              ListView.builder(
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
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}
