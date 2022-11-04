import 'dart:convert';

import 'package:buon_appetito/features/home/data/data_sources/pizza_data_source.dart';
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
}
