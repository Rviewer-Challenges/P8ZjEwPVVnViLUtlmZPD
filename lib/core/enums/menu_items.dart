import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

enum MenuItems {
  home,
  orders,
}

extension MenuItemsString on MenuItems {
  String getString() {
    return toString().replaceAll('MenuItems.', '').toLowerCase();
  }
}

extension MenuItemsDisplayScreen on MenuItems {
  String displayString(BuildContext context) {
    switch (this) {
      case MenuItems.home:
        return AppLocalizations.of(context)!.pizzas;
      case MenuItems.orders:
        return AppLocalizations.of(context)!.orders;
    }
  }
}
