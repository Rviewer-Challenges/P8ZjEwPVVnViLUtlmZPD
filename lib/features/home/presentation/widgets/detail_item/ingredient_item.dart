import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/features/home/data/models/ingredient_model.dart';
import 'package:flutter/material.dart';

class IngredientItem extends StatelessWidget {
  final IngredientModel ingredient;
  final Function(bool? value) onChanged;

  const IngredientItem({
    Key? key,
    required this.ingredient,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        border: Border.all(color: borderColor),
        borderRadius: BorderRadius.circular(10),
      ),
      child: CheckboxListTile(
        value: ingredient.active,
        title: Text(ingredient.name),
        onChanged: onChanged,
      ),
    );
  }
}
