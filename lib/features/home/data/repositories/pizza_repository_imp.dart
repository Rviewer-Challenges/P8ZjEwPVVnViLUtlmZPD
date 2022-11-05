import 'dart:convert';

import 'package:buon_appetito/features/home/data/data_sources/pizza_data_source.dart';
import 'package:buon_appetito/features/home/data/models/pizza_halve_model.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/domain/repositories/pizza_repository.dart';
import 'package:flutter/material.dart';

class PizzaRepositoryImp implements PizzaRepository {
  final PizzaDataSource pizzaDataSource;

  PizzaRepositoryImp({
    required this.pizzaDataSource,
  });

  @override
  Future<dynamic> loadPizzas() async {
    try {
      final List<String> data = await pizzaDataSource.loadFiles();
      List<dynamic> pizzas = jsonDecode(data[0]);
      List<dynamic> ingredients = jsonDecode(data[1]);
      List<PizzaModel> listPizzas = [];
      for (Map<String, dynamic> pizza in pizzas) {
        listPizzas.add(PizzaModel.fromJsonWithIngredients(pizza, ingredients));
      }
      return listPizzas;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  @override
  Future<dynamic> addHalvePizza(PizzaModel pizza) async {
    PizzaModel newPizza = PizzaModel(
      id: pizza.id,
      name: pizza.name,
      description: pizza.description,
      imageURL: pizza.imageURL,
      ingredients: pizza.ingredients,
      price: pizza.price,
      halves: [...pizza.halves, PizzaHalveModel(ingredients: pizza.ingredients)],
    );
    return newPizza;
  }

  @override
  Future<dynamic> removeHalvePizza(PizzaModel pizza, int halveId) async {
    PizzaModel newPizza = PizzaModel(
      id: pizza.id,
      name: pizza.name,
      description: pizza.description,
      imageURL: pizza.imageURL,
      ingredients: pizza.ingredients,
      price: pizza.price,
      halves: [...pizza.halves.where((halve) => halve.id != halveId).toList()],
    );
    return newPizza;
  }
}
