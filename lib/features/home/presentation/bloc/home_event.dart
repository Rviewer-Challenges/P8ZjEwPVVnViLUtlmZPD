part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
}

class LoadPizzasEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class GetPizzasEvent extends HomeEvent {
  @override
  List<Object> get props => [];
}

class AddHalvePizzaEvent extends HomeEvent {
  final PizzaModel pizza;

  const AddHalvePizzaEvent(this.pizza);

  @override
  List<Object> get props => [
        pizza,
      ];
}

class RemoveHalvePizzaEvent extends HomeEvent {
  final PizzaModel pizza;
  final int halveId;

  const RemoveHalvePizzaEvent(this.pizza, this.halveId);

  @override
  List<Object> get props => [
        pizza,
    halveId,
      ];
}
