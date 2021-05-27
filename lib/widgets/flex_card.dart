import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';

class FlexCard extends StatelessWidget {
  final List<FlexResponsiveItem> items;
  final String title;
  final String? messageImage;
  final String? message;
  const FlexCard({
    Key? key,
    required this.items,
    required this.title,
    this.message,
    this.messageImage,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width < 800
        ? MediaQuery.of(context).size.width < 400
            ? 25
            : 30
        : 40;
    double iconSize = MediaQuery.of(context).size.width < 800 ? 55 : 80;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(title,
                textAlign: TextAlign.left,
                style:
                    TextStyle(fontFamily: 'JosefinSans', fontSize: fontSize)),
            if (messageImage != null)
              Image.asset(
                messageImage!,
                width: iconSize,
                height: iconSize,
              )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        if (message != null)
          Text(
            message!,
            style: StyleConstants.kDefaultTextStyle,
          ),
        SizedBox(
          height: 40,
        ),
        Center(
            child: FlexResponsive(
          items: items,
        )),
      ],
    );
  }
}
