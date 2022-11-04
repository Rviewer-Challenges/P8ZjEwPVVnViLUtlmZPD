import 'package:buon_appetito/features/cart/presentation/widgets/cart/cart_body.dart';
import 'package:flutter/material.dart';

class CartPage extends StatelessWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: const CartBody(),
    );
  }
}
