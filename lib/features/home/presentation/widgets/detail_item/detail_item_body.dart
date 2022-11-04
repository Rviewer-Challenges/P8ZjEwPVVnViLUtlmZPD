import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/core/utils/text_utils.dart';
import 'package:buon_appetito/features/home/presentation/widgets/detail_item/ingredient_item.dart';
import 'package:flutter/material.dart';
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

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
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
                margin: const EdgeInsets.only(top: 10),
                constraints: BoxConstraints(minHeight: constraints.maxHeight * 0.7),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(48),
                    topRight: Radius.circular(48),
                  ),
                ),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(32, 32, 32, 40),
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
                        padding: const EdgeInsets.only(top: 10, bottom: 4),
                        child: Text(
                          AppLocalizations.of(context)!.ingredients,
                          style: const TextStyle(
                            color: greyTextColor,
                            fontSize: 18,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (_, index) {
                          return IngredientItem(
                            ingredient: widget.item.ingredients[index],
                            onChanged: (bool? value) {
                              // widget.item.ingredients[index].active = value == true;
                            },
                          );
                        },
                        itemCount: widget.item.ingredients.length,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextButton.icon(
                              onPressed: () {
                                // BlocProvider.of<CartBloc>(context).add(AddItemToCartEvent(pizza));
                              },
                              icon: const Icon(Icons.add_shopping_cart),
                              label: Text(AppLocalizations.of(context)!.add),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
