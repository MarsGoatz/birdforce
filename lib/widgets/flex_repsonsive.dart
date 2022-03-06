import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FlexResponsive extends StatelessWidget {
  final List<FlexResponsiveItem> items;

  const FlexResponsive({Key? key, required this.items}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var breakPoint = 1000;
    Axis direction = MediaQuery.of(context).size.width < breakPoint
        ? Axis.vertical
        : Axis.horizontal;
    FlexFit fit = MediaQuery.of(context).size.width < breakPoint
        ? FlexFit.loose
        : FlexFit.tight;

    var separtorWidth = MediaQuery.of(context).size.width < breakPoint ? 0 : 20;
    var separtorHeight =
        MediaQuery.of(context).size.width < breakPoint ? 50 : 0;

    late List<Widget> children = List.empty(growable: true);

    items.asMap().forEach((key, value) {
      children.add(
        Flexible(
          flex: value.flex ?? 1,
          fit: fit,
          child: value.child,
        ),
      );

      if (key != items.length - 1)
        children.add(
          Flexible(
            flex: 1,
            fit: fit,
            child: SizedBox(
              width: separtorWidth.toDouble(),
              height: separtorHeight.toDouble(),
            ),
          ),
        );
    });

    return Flex(
        mainAxisSize: MainAxisSize.min,
        direction: direction,
        children: children);
  }
}

class FlexResponsiveItem {
  final int? flex;
  final Widget child;

  FlexResponsiveItem({this.flex, required this.child});
}
