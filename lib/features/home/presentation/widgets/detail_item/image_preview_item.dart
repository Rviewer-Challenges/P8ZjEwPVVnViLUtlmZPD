import 'package:buon_appetito/core/models/item.dart';
import 'package:buon_appetito/core/utils/colors.dart';
import 'package:flutter/material.dart';

class ImagePreviewItem extends StatelessWidget {
  final Item item;

  const ImagePreviewItem({
    Key? key,
    required this.item,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          item.name,
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
                'assets/images/${item.imageURL}',
                height: 100,
                width: 100,
                fit: BoxFit.fill,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
