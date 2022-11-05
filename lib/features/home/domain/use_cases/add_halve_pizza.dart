import 'package:buon_appetito/core/models/use_case.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/domain/repositories/pizza_repository.dart';
import 'package:equatable/equatable.dart';

class AddHalvePizza extends UseCase<PizzaModel, AddHalvePizzaParams> {
  final PizzaRepository repository;

  AddHalvePizza(this.repository);

  @override
  Future<dynamic> call(AddHalvePizzaParams params) async {
    return await repository.addHalvePizza(params.pizza);
  }
}

class AddHalvePizzaParams extends Equatable {
  final PizzaModel pizza;

  const AddHalvePizzaParams(this.pizza);

  @override
  List<Object> get props => [];
}
