import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buon_appetito/core/utils/colors.dart';

class Loader extends StatelessWidget {
  const Loader({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: blackTextColor.withOpacity(.2),
        borderRadius: BorderRadius.circular(10),
      ),
      width: 100,
      height: 100,
      padding: const EdgeInsets.all(32),
      child: const CircularProgressIndicator(
        color: whiteColor,
      ),
    );
  }
}
