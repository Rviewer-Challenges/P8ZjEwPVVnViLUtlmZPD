import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/utils/variables.dart';
import 'package:buon_appetito/core/data/data_sources/local_data_source/local_storage_data_source.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';

abstract class CartDataSource {
  Future<dynamic> loadItemsCart();

  Future<dynamic> saveItemInCart(Item item);
}

class CartDataSourceImp implements CartDataSource {
  LocalStorageDataSource localStorageDataSource;

  CartDataSourceImp({
    required this.localStorageDataSource,
  });

  @override
  Future loadItemsCart() async {
    final jsonItems = localStorageDataSource.getData(lsCartKey) ?? [];
    List<Item> items = [];

    for (var item in jsonItems) {
      final pizza = PizzaModel.fromJson(item);
      items.add(pizza);
    }

    return items;
  }

  @override
  Future saveItemInCart(Item item) async {
    List<Map<String, dynamic>> items = [];

    final data = localStorageDataSource.getData(lsCartKey);

    if (data == null) {
      items.add(item.toJson());
    } else {
      items = [...data, item.toJson()];
    }

    await localStorageDataSource.saveData(lsCartKey, items);
  }
}
