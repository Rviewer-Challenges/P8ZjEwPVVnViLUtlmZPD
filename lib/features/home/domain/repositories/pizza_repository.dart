import 'package:buon_appetito/features/home/data/models/pizza_model.dart';

abstract class PizzaRepository {
  Future<dynamic> loadPizzas();
  Future<dynamic> addHalvePizza(PizzaModel pizza);
  Future<dynamic> removeHalvePizza(PizzaModel pizza, int halveId);
}
