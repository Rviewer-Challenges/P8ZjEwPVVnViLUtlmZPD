import 'package:buon_appetito/core/router/arguments.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/detail_item_body.dart';
import 'package:buon_appetito/features/home/presentation/widgets/home/app_bar_home.dart';
import 'package:flutter/material.dart';

class DetailItemPage extends StatelessWidget {
  final DetailItemPageArguments args;

  const DetailItemPage(
    this.args, {
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: mainColor,
      appBar: const AppBarHome(
        showTitle: false,
        buttonsColor: Colors.white,
        cartCountColor: Colors.black,
      ),
      body: DetailItemBody(item: args.item),
      // bottomNavigationBar: CustomBottomNavigationBar(option: MenuItems.home),
    );
  }
}
