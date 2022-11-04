import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/core/utils/text_utils.dart';
import 'package:buon_appetito/core/widgets/success_icon.dart';
import 'package:buon_appetito/features/cart/presentation/bloc/cart_bloc.dart';
import 'package:buon_appetito/features/home/data/models/pizza_model.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/detail_halve_pizza.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/ingredient_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:readmore/readmore.dart';

class DetailItemBody extends StatefulWidget {
  final Item item;

  const DetailItemBody({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  State<DetailItemBody> createState() => _DetailItemBodyState();
}

class _DetailItemBodyState extends State<DetailItemBody> {
  ValueNotifier<bool> isExpanded = ValueNotifier(false);
  ValueNotifier<bool> isAdded = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CartBloc, CartState>(
      listener: (context, state) {
        if (state is AddItemToCartSuccess) {
          isAdded.value = true;
          Future.delayed(const Duration(seconds: 2), () {
            isAdded.value = false;
          });
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        constraints: BoxConstraints(minHeight: constraints.maxHeight * 0.3),
                        child: Column(
                          children: [
                            Text(
                              widget.item.name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 32,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 32),
                              decoration: BoxDecoration(
                                gradient: RadialGradient(colors: [
                                  Colors.white.withOpacity(.5),
                                  mainColor.withOpacity(.5),
                                ], focalRadius: .1, radius: .5),
                              ),
                              child: Center(
                                child: SizedBox(
                                  height: 150,
                                  width: 150,
                                  child: Image.asset(
                                    'assets/images/${widget.item.imageURL}',
                                    height: 100,
                                    width: 100,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.fromLTRB(32, 32, 32, 40),
                        margin: const EdgeInsets.only(top: 10),
                        constraints: BoxConstraints(minHeight: constraints.maxHeight * 0.7),
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(48),
                            topRight: Radius.circular(48),
                          ),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(bottom: 4),
                              child: Text(
                                AppLocalizations.of(context)!.description,
                                style: const TextStyle(
                                  color: greyTextColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            ReadMoreText(
                              !isEmpty(widget.item.description)
                                  ? widget.item.description!
                                  : AppLocalizations.of(context)!.noDescription,
                              trimLines: 3,
                              style: const TextStyle(color: lightGreyTextColor),
                              trimMode: TrimMode.Line,
                              trimCollapsedText: 'Show more',
                              trimExpandedText: '\nShow less',
                              moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                              lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 16, bottom: 4),
                              child: Text(
                                AppLocalizations.of(context)!.ingredients,
                                style: const TextStyle(
                                  color: greyTextColor,
                                  fontSize: 18,
                                ),
                              ),
                            ),
                            DetailHalvePizza(pizza: widget.item as PizzaModel),
                            // ListView.builder(
                            //   shrinkWrap: true,
                            //   physics: const NeverScrollableScrollPhysics(),
                            //   itemBuilder: (_, index) {
                            //     final pizza = widget.item as PizzaModel;
                            //
                            //     return IngredientItem(
                            //       ingredient: pizza.halves.ingredients[index],
                            //       onChanged: (bool? value) {
                            //         // widget.item.ingredients[index].active = value == true;
                            //       },
                            //     );
                            //   },
                            //   itemCount: widget.item.ingredients.length,
                            // ),
                            Row(
                              children: [
                                Expanded(
                                  child: TextButton.icon(
                                    onPressed: () {
                                      BlocProvider.of<CartBloc>(context).add(AddItemToCartEvent(widget.item));
                                    },
                                    icon: const Icon(Icons.add_shopping_cart),
                                    label: Text(AppLocalizations.of(context)!.add),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
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
  }
}
