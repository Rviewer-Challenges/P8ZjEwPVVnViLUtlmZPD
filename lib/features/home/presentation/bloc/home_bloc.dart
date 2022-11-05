import 'package:bloc/bloc.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/domain/use_cases/add_halve_pizza.dart';
import 'package:buon_appetito/features/home/domain/use_cases/load_pizzas.dart';
import 'package:buon_appetito/features/home/domain/use_cases/remove_halve_pizza.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadPizzas loadPizzas;
  final AddHalvePizza addHalvePizza;
  final RemoveHalvePizza removeHalvePizza;

  List<PizzaModel> listPizzas = [];

  HomeBloc({
    required this.loadPizzas,
    required this.addHalvePizza,
    required this.removeHalvePizza,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LoadPizzasEvent>(onLoadPizzasEvent);
    on<GetPizzasEvent>(onGetPizzasEvent);
    on<AddHalvePizzaEvent>(onAddHalvePizzaEvent);
    on<RemoveHalvePizzaEvent>(onRemoveHalvePizzaEvent);
  }

  dynamic onLoadPizzasEvent(event, emit) async {
    emit(Loading());
    try {
      final response = await loadPizzas(const LoadPizzasParams());
      listPizzas = response;
      emit(LoadPizzasSuccess(response));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(Error(e.toString()));
    }
  }

  dynamic onGetPizzasEvent(event, emit) async {
    emit(Loading());
    try {
      emit(GetPizzasSuccess(listPizzas));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(Error(e.toString()));
    }
  }

  dynamic onAddHalvePizzaEvent(event, emit) async {
    emit(Loading());
    try {
      final response = await addHalvePizza(AddHalvePizzaParams(event.pizza));
      emit(AddHalvePizzaSuccess(response));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(Error(e.toString()));
    }
  }

  dynamic onRemoveHalvePizzaEvent(event, emit) async {
    emit(Loading());
    try {
      final response = await removeHalvePizza(RemoveHalvePizzaParams(event.pizza, event.halveId));
      emit(RemoveHalvePizzaSuccess(response));
    } catch (e) {
      debugPrint("Bloc Error: ${e.toString()}");
      emit(Error(e.toString()));
    }
  }
}
