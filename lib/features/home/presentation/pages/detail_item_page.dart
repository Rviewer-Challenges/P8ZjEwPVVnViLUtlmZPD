import 'package:buon_appetito/features/home/presentation/widgets/detail_item/detail_item_body.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DetailItemPage extends StatelessWidget {
  const DetailItemPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      // appBar: AppBarHome(),
      body: DetailItemBody(),
      // bottomNavigationBar: CustomBottomNavigationBar(option: MenuItems.home),
    );
  }
}
