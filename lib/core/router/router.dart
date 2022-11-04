import 'package:buon_appetito/core/router/arguments.dart';
import 'package:buon_appetito/features/cart/presentation/pages/cart_page.dart';
import 'package:buon_appetito/features/home/presentation/pages/detail_item_page.dart';
import 'package:flutter/material.dart';
import 'package:buon_appetito/core/router/routes.dart';
import 'package:buon_appetito/features/home/presentation/pages/home_page.dart';

class Router {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePageRoute:
        return MaterialPageRoute(builder: (context) => const HomePage());
      case detailItemRoute:
        return MaterialPageRoute(builder: (context) {
          final args = settings.arguments as DetailItemPageArguments;
          return DetailItemPage(args);
        });
      case shoppingCartRoute:
        return MaterialPageRoute(builder: (context) => const CartPage());
      default:
        return MaterialPageRoute(builder: (context) => const HomePage());
    }
  }
}
