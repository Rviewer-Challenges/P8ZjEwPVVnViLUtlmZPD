import 'package:buon_appetito/dependencies/injection_dependencies.dart';
import 'package:buon_appetito/features/home/data/data_sources/pizza_data_source.dart';
import 'package:buon_appetito/features/home/data/repositories/pizza_repository_imp.dart';
import 'package:buon_appetito/features/home/domain/repositories/pizza_repository.dart';
import 'package:buon_appetito/features/home/domain/use_cases/load_pizzas.dart';
import 'package:buon_appetito/features/home/presentation/bloc/home_bloc.dart';

void registerHomeDependencies() {
  getIt.registerFactory(
    () => HomeBloc(
      loadPizzas: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => LoadPizzas(getIt()));

  getIt.registerLazySingleton<PizzaRepository>(
    () => PizzaRepositoryImp(
      pizzaDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<PizzaDataSource>(
    () => PizzaDataSourceImp(
      localStorageDataSource: getIt(),
    ),
  );
}
