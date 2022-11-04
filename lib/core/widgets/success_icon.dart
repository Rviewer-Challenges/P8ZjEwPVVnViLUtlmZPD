import 'package:flutter/material.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SuccessIcon extends StatelessWidget {
  const SuccessIcon({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackTextColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 100,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.check,
            color: Colors.white,
            size: 48,
          ),
          Text(
            AppLocalizations.of(context)!.added,
            style: const TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }
}
