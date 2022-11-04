part of 'home_bloc.dart';

abstract class HomeState extends Equatable {
  const HomeState();
}

class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class Loading extends HomeState {
  @override
  List<Object> get props => [];
}

class Error extends HomeState {
  final String message;

  const Error(this.message);

  @override
  List<Object?> get props => [message];
}

class LoadPizzasSuccess extends HomeState {
  final List<PizzaModel> pizzas;

  const LoadPizzasSuccess(this.pizzas);

  @override
  List<Object?> get props => [pizzas];
}

class GetPizzasSuccess extends HomeState {
  final List<PizzaModel> pizzas;

  const GetPizzasSuccess(this.pizzas);

  @override
  List<Object?> get props => [pizzas];
}
