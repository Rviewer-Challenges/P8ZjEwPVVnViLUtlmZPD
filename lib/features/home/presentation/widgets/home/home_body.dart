import 'package:buon_appetito/core/widgets/loader.dart';
import 'package:buon_appetito/core/widgets/success_icon.dart';
import 'package:buon_appetito/features/cart/data/models/cart_model.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart' as cart_bloc;
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/presentation/bloc/home_bloc.dart';
import 'package:buon_appetito/features/home/presentation/widgets/home/item_pizza.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';

class HomeBody extends StatefulWidget {
  const HomeBody({Key? key}) : super(key: key);

  @override
  State<HomeBody> createState() => _HomeBodyState();
}

class _HomeBodyState extends State<HomeBody> {
  List<PizzaModel> pizzas = [];
  CartModel cart = const CartModel(items: []);
  bool isLoading = false;
  ValueNotifier<bool> isAdded = ValueNotifier(false);

  @override
  void initState() {
    BlocProvider.of<HomeBloc>(context).add(GetPizzasEvent());
    BlocProvider.of<cart_bloc.CartBloc>(context).add(cart_bloc.GetCartEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is GetPizzasSuccess) {
          pizzas = state.pizzas;
        }
      },
      builder: (context, state) {
        return BlocConsumer<cart_bloc.CartBloc, cart_bloc.CartState>(
          listener: (context, state) {
            if (state is cart_bloc.AddItemToCartSuccess) {
              isAdded.value = true;
              Future.delayed(const Duration(seconds: 2), () {
                isAdded.value = false;
              });
            }
          },
          builder: (context, state) {
            return Stack(
              children: [
                SafeArea(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16),
                        child: Text(
                          AppLocalizations.of(context)!.findYourPizza,
                          style: const TextStyle(color: Colors.black, fontSize: 22),
                          textAlign: TextAlign.start,
                        ),
                      ),
                      Expanded(
                        child: ListView.builder(
                          itemBuilder: (_, index) {
                            return ItemPizza(
                              pizza: pizzas[index],
                            );
                          },
                          itemCount: pizzas.length,
                        ),
                      ),
                    ],
                  ),
                ),
                if (isLoading) const Center(child: Loader()),
                ValueListenableBuilder(
                  valueListenable: isAdded,
                  builder: (BuildContext context, bool value, Widget? child) {
                    return value == true ? const Center(child: SuccessIcon()) : const SizedBox();
                  },
                ),
              ],
            );
          },
        );
      },
    );
  }
}
