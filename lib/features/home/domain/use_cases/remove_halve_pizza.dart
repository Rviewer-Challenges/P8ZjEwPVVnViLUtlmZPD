import 'package:buon_appetito/core/models/use_case.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/domain/repositories/pizza_repository.dart';
import 'package:equatable/equatable.dart';

class RemoveHalvePizza extends UseCase<PizzaModel, RemoveHalvePizzaParams> {
  final PizzaRepository repository;

  RemoveHalvePizza(this.repository);

  @override
  Future<dynamic> call(RemoveHalvePizzaParams params) async {
    return await repository.removeHalvePizza(params.pizza, params.halveId);
  }
}

class RemoveHalvePizzaParams extends Equatable {
  final PizzaModel pizza;
  final int halveId;

  const RemoveHalvePizzaParams(this.pizza, this.halveId);

  @override
  List<Object> get props => [];
}
