import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:buon_appetito/core/utils/text_utils.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DescriptionItem extends StatelessWidget {
  final Item item;

  const DescriptionItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
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
          !isEmpty(item.description) ? item.description! : AppLocalizations.of(context)!.noDescription,
          trimLines: 3,
          style: const TextStyle(color: lightGreyTextColor),
          trimMode: TrimMode.Line,
          trimCollapsedText: 'Show more',
          trimExpandedText: '\nShow less',
          moreStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          lessStyle: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
