import 'package:flutter/material.dart';
import 'package:buon_appetito/core/enums/menu_items.dart';
import 'package:buon_appetito/core/router/routes.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final MenuItems option;

  const CustomBottomNavigationBar({
    Key? key,
    this.option = MenuItems.home,
  }) : super(key: key);

  @override
  State<CustomBottomNavigationBar> createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  List<BottomNavigationBarItem> options = [];

  @override
  Widget build(BuildContext context) {
    int currentIndex = MenuItems.values.indexWhere((element) => element == widget.option);
    loadOptions();

    return BottomNavigationBar(
      items: options,
      onTap: (index) {
        final currentRoute = ModalRoute.of(context)?.settings.name;
        if (index == 0 && currentRoute != homePageRoute) {
          Navigator.of(context).pushNamedAndRemoveUntil(homePageRoute, (route) => false);
          // } else if (index == 1 && currentRoute != profilePageRoute) {
          //   Navigator.of(context).pushNamedAndRemoveUntil(profilePageRoute, (route) => false);
        }
        setState(() {
          currentIndex = index;
        });
      },
      currentIndex: currentIndex,
    );
  }

  void loadOptions() {
    options = [
      BottomNavigationBarItem(
        icon: const RotatedBox(
          quarterTurns: 2,
          child: Icon(
            Icons.local_pizza,
          ),
        ),
        label: MenuItems.home.displayString(context),
      ),
      BottomNavigationBarItem(
        icon: const Icon(Icons.sports_motorsports),
        label: MenuItems.orders.displayString(context),
      ),
    ];
  }
}
