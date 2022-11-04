import 'package:flutter/cupertino.dart';
import 'package:buon_appetito/core/utils/colors.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final EdgeInsets? padding;
  final double? minHeight;
  final Color? color;
  final bool showBorders;

  const CustomContainer({
    Key? key,
    required this.child,
    this.padding,
    this.minHeight,
    this.color,
    this.showBorders = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        constraints: BoxConstraints(maxWidth: 1440, minHeight: minHeight ?? 0.0),
        padding: padding ?? const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        decoration: showBorders
            ? BoxDecoration(
                border: const Border.symmetric(
                  vertical: BorderSide(width: 1, color: greyTextColor),
                ),
                color: color,
              )
            : null,
        child: child,
      ),
    );
  }
}
