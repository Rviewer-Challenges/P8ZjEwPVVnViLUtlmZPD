import 'package:buon_appetito/core/router/arguments.dart';
import 'package:buon_appetito/core/router/routes.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/core/utils/money.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ItemPizza extends StatelessWidget {
  final PizzaModel pizza;

  const ItemPizza({
    Key? key,
    required this.pizza,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ingredients = pizza.ingredients.map((ingredient) => ingredient.name);
    return Column(
      children: [
        InkWell(
          onTap: () {
            Navigator.of(context).pushNamed(
              detailItemRoute,
              arguments: DetailItemPageArguments(item: pizza),
            );
          },
          splashColor: mainColor,
          highlightColor: mainColor.withOpacity(.5),
          child: Container(
            padding: const EdgeInsets.all(10),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40.0),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10)),
                      ),
                      padding: const EdgeInsets.fromLTRB(152, 10, 10, 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            pizza.name,
                            style: const TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 5, bottom: 8),
                            child: Text(
                              ingredients.join(", "),
                              style: const TextStyle(fontSize: 12, color: greyEditColor),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  pizza.description ?? "",
                                  style: const TextStyle(fontSize: 14, color: greyEditColor),
                                ),
                              ),
                              Text(
                                formatCurrency(pizza.price),
                                style: const TextStyle(fontSize: 16, color: mainColor),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            decoration: const BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10),
                              ),
                            ),
                            child: TextButton.icon(
                              onPressed: () {
                                BlocProvider.of<CartBloc>(context).add(AddItemToCartEvent(pizza));
                              },
                              icon: const Icon(Icons.add_shopping_cart),
                              label: Text(AppLocalizations.of(context)!.add),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                Positioned(
                  top: 0,
                  left: 16,
                  child: Image.asset(
                    "assets/images/${pizza.imageURL}",
                    width: 120,
                    height: 120,
                    fit: BoxFit.fill,
                  ),
                ),
              ],
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
