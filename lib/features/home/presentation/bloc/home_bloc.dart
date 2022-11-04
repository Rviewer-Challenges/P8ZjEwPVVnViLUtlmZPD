import 'package:bloc/bloc.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/domain/use_cases/load_pizzas.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'home_event.dart';

part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final LoadPizzas loadPizzas;

  List<PizzaModel> listPizzas = [];

  HomeBloc({
    required this.loadPizzas,
  }) : super(HomeInitial()) {
    on<HomeEvent>((event, emit) {});
    on<LoadPizzasEvent>(onLoadPizzasEvent);
    on<GetPizzasEvent>(onGetPizzasEvent);
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
}
