import 'package:buon_appetito/core/enums/menu_items.dart';
import 'package:buon_appetito/core/widgets/custom_bottom_navigation_bar.dart';
import 'package:buon_appetito/features/home/presentation/widgets/home/app_bar_home.dart';
import 'package:buon_appetito/features/home/presentation/widgets/home/home_body.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: AppBarHome(),
      body: HomeBody(),
      bottomNavigationBar: CustomBottomNavigationBar(option: MenuItems.home),
    );
  }
}
