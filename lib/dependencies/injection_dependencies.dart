import 'package:buon_appetito/core/data/data_sources/local_data_source/local_storage_data_source.dart';
import 'package:buon_appetito/core/utils/variables.dart';
import 'package:buon_appetito/dependencies/cart_dependencies.dart';
import 'package:buon_appetito/dependencies/home_dependencies.dart';
import 'package:get_it/get_it.dart';
import 'package:localstorage/localstorage.dart';

final getIt = GetIt.instance;

void registerInjections() {
  initExternalDependencies();
  registerLocalStorageDependencies();
  registerHomeDependencies();
  registerCartDependencies();
}

void registerLocalStorageDependencies() {
  getIt.registerLazySingleton<LocalStorageDataSource>(
    () => LocalStorageDataSourceImpl(
      localStorage: getIt(),
    ),
  );
}

void initExternalDependencies() {
  final LocalStorage storage = LocalStorage(lsFileKey);
  getIt.registerLazySingleton(() => storage);
}
