import 'package:buon_appetito/dependencies/injection_dependencies.dart';
import 'package:buon_appetito/features/cart/data/data_sources/cart_data_source.dart';
import 'package:buon_appetito/features/cart/data/repositories/cart_repository_imp.dart';
import 'package:buon_appetito/features/cart/domain/repositories/cart_repository.dart';
import 'package:buon_appetito/features/cart/domain/use_cases/add_to_cart.dart';
import 'package:buon_appetito/features/cart/domain/use_cases/load_items_cart.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';

void registerCartDependencies() {
  getIt.registerFactory(
    () => CartBloc(
      addToCart: getIt(),
      loadItemsCart: getIt(),
    ),
  );

  getIt.registerLazySingleton(() => AddToCart(getIt()));
  getIt.registerLazySingleton(() => LoadItemsCart(getIt()));

  getIt.registerLazySingleton<CartRepository>(
    () => CartRepositoryImp(
      cartDataSource: getIt(),
    ),
  );

  getIt.registerLazySingleton<CartDataSource>(
    () => CartDataSourceImp(
      localStorageDataSource: getIt(),
    ),
  );
}
