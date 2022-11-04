import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:buon_appetito/core/utils/colors.dart';

class CustomButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget? label;
  final String? text;
  final Widget? icon;
  final double width;
  final Color? color;
  final Color? textColor;

  const CustomButton({
    Key? key,
    required this.onPressed,
    this.label,
    this.text,
    this.icon,
    this.width = 200,
    this.color,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      onPressed: onPressed,
      icon: icon ?? const SizedBox(),
      label: label ??
          Text(
            text ?? "",
            style: TextStyle(
              color: textColor ?? blackTextColor,
              fontSize: 16.0,
            ),
          ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.resolveWith<Color?>(
          (Set<MaterialState> states) {
            if (states.contains(MaterialState.pressed)) {
              return Theme.of(context).colorScheme.primary.withOpacity(0.5);
            }
            return color ?? Colors.white;
          },
        ),
        side: MaterialStateProperty.all(
          const BorderSide(
            style: BorderStyle.solid,
            color: greyTextColor,
            width: 1.0,
          ),
        ),
        maximumSize: MaterialStateProperty.all(Size(width, 50)),
        minimumSize: MaterialStateProperty.all(Size(width, 50)),
      ),
    );
  }
}
