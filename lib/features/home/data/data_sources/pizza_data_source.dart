import 'package:buon_appetito/core/utils/language_utils.dart';
import 'package:buon_appetito/core/utils/variables.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:flutter/services.dart' show rootBundle;

import 'package:buon_appetito/core/data/data_sources/local_data_source/local_storage_data_source.dart';

abstract class PizzaDataSource {
  Future<dynamic> loadFiles();

  Future<dynamic> savePizzaInCart(PizzaModel pizza);
}

class PizzaDataSourceImp implements PizzaDataSource {
  LocalStorageDataSource localStorageDataSource;

  PizzaDataSourceImp({
    required this.localStorageDataSource,
  });

  @override
  Future<dynamic> loadFiles() async {
    String language = getLocale();
    String dataPizzas = await rootBundle.loadString('assets/data/$language/pizzas.json');
    String dataIngredients = await rootBundle.loadString('assets/data/$language/ingredients.json');
    return [dataPizzas, dataIngredients];
  }

  @override
  Future savePizzaInCart(PizzaModel pizza) async {
    await localStorageDataSource.saveData(lsCartKey, pizza.toJson());
  }
}
