import 'package:buon_appetito/core/models/use_case.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/domain/repositories/pizza_repository.dart';
import 'package:equatable/equatable.dart';

class LoadPizzas extends UseCase<PizzaModel, LoadPizzasParams> {
  final PizzaRepository repository;

  LoadPizzas(this.repository);

  @override
  Future<dynamic> call(LoadPizzasParams params) async {
    return await repository.loadPizzas();
  }
}

class LoadPizzasParams extends Equatable {
  const LoadPizzasParams();

  @override
  List<Object> get props => [];
}
