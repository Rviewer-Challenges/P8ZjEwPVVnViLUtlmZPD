import 'package:buon_appetito/core/utils/colors.dart';
import 'package:flutter/material.dart';

class TitleNavigationBar extends StatelessWidget {
  final String? title;
  final Function? onPop;
  final dynamic popResult;
  final Color? color;
  final double? fontSize;
  final EdgeInsets? padding;
  final Widget? child;
  final Widget? actions;

  const TitleNavigationBar({
    super.key,
    this.title,
    this.onPop,
    this.popResult,
    this.color,
    this.fontSize,
    this.padding,
    this.child,
    this.actions,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.centerLeft,
              children: [
                Navigator.of(context).canPop()
                    ? Padding(
                        padding: padding ?? EdgeInsets.zero,
                        child: IconButton(
                          padding: EdgeInsets.zero,
                          icon: Icon(
                            Icons.arrow_back_ios,
                            color: color ?? greyEditColor,
                          ),
                          splashRadius: 32.0,
                          onPressed: () {
                            onPop != null ? onPop!() : Navigator.of(context).pop(popResult ?? 'refresh');
                          },
                        ),
                      )
                    : const SizedBox(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 48.0),
                  child: title != null
                      ? Center(
                          child: FittedBox(
                            fit: BoxFit.scaleDown,
                            child: Text(
                              title ?? "",
                              style: TextStyle(
                                color: color ?? titleBarColor,
                                fontWeight: FontWeight.w700,
                                fontSize: fontSize ?? 34.0,
                              ),
                            ),
                          ),
                        )
                      : child ?? const SizedBox(),
                ),
              ],
            ),
          ),
          actions ?? const SizedBox(),
        ],
      ),
    );
  }
}
