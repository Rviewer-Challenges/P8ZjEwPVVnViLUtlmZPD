import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/presentation/bloc/home_bloc.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/detail_halve_pizza.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class HalvesItemSection extends StatefulWidget {
  final Item item;

  const HalvesItemSection({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<HalvesItemSection> createState() => _HalvesItemSectionState();
}

class _HalvesItemSectionState extends State<HalvesItemSection> {
  late PizzaModel pizza;

  @override
  void initState() {
    pizza = widget.item as PizzaModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeBloc, HomeState>(
      listener: (context, state) {
        if (state is AddHalvePizzaSuccess) {
          pizza = state.pizza;
        } else if (state is RemoveHalvePizzaSuccess) {
          pizza = state.pizza;
        }
      },
      builder: (context, state) {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    AppLocalizations.of(context)!.halves,
                    style: const TextStyle(
                      color: greyTextColor,
                      fontSize: 18,
                    ),
                    maxLines: 1,
                  ),
                ),
                Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        if (pizza.halves.length <= 1) {
                          return;
                        }
                        BlocProvider.of<HomeBloc>(context).add(
                          RemoveHalvePizzaEvent(pizza, pizza.halves[pizza.halves.length - 1].id),
                        );
                      },
                      icon: const Icon(Icons.remove),
                      splashRadius: 16,
                    ),
                    Text(pizza.halves.length.toString()),
                    IconButton(
                      onPressed: () {
                        if (pizza.halves.length >= 4) {
                          ScaffoldMessenger.of(context).removeCurrentSnackBar();
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                AppLocalizations.of(context)!.halveLimitationMessage,
                              ),
                              behavior: SnackBarBehavior.floating,
                              backgroundColor: redColor,
                              duration: const Duration(seconds: 2),
                            ),
                          );
                          return;
                        }

                        BlocProvider.of<HomeBloc>(context).add(AddHalvePizzaEvent(pizza));
                      },
                      icon: const Icon(Icons.add),
                    ),
                  ],
                )
              ],
            ),
            DetailHalvePizza(pizza: pizza),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextButton.icon(
                    onPressed: () {
                      BlocProvider.of<CartBloc>(context).add(AddItemToCartEvent(pizza));
                    },
                    icon: const Icon(Icons.add_shopping_cart),
                    label: Text(AppLocalizations.of(context)!.add),
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
