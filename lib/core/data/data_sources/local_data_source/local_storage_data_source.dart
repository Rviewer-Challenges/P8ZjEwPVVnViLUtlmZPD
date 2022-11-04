import 'package:localstorage/localstorage.dart';

abstract class LocalStorageDataSource {
  Future<void> saveData(keyName, value);

  dynamic getData(keyName);

  Future<void> delete(keyName);

  Future<void> clear();
}

class LocalStorageDataSourceImpl implements LocalStorageDataSource {
  LocalStorage localStorage;

  LocalStorageDataSourceImpl({
    required this.localStorage,
  });

  @override
  Future<void> saveData(keyName, value) async {
    return await localStorage.setItem(keyName, value);
  }

  @override
  dynamic getData(keyName) {
    return localStorage.getItem(keyName);
  }

  @override
  Future<void> delete(keyName) async {
    return await localStorage.deleteItem(keyName);
  }

  @override
  Future<void> clear() async {
    return await localStorage.clear();
  }
}
