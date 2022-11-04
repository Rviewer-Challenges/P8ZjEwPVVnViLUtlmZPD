import 'package:buon_appetito/core/routes.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/core/utils/variables.dart';
import 'package:buon_appetito/features/cart/data/models/cart_model.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBarHome extends StatelessWidget implements PreferredSizeWidget {
  const AppBarHome({Key? key}) : super(key: key);

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    CartModel cart = const CartModel(items: []);
    BlocProvider.of<CartBloc>(context).add(GetCartEvent());

    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is GetCartSuccess) {
          cart = state.cart;
        }
      },
      builder: (context, state) {
        return AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: const Text(
            appName,
            style: TextStyle(color: Colors.black, fontSize: 24),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Stack(
                children: [
                  IconButton(
                    icon: const Icon(
                      Icons.shopping_cart_outlined,
                      color: mainColor,
                    ),
                    splashRadius: 24,
                    onPressed: () {
                      Navigator.of(context).pushNamed(shoppingCartRoute);
                    },
                  ),
                  cart.items.isNotEmpty
                      ? Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: mainColor,
                            ),
                            padding: const EdgeInsets.all(6),
                            child: Center(
                              child: Text(
                                cart.items.length.toString(),
                                style: const TextStyle(
                                  fontSize: 10,
                                ),
                              ),
                            ),
                          ),
                        )
                      : const SizedBox(),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
