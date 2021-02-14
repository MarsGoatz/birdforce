import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Community extends StatelessWidget {
  const Community({
    Key key,
  }) : super(key: key);

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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Community',
            textAlign: TextAlign.left,
            style: TextStyle(fontFamily: 'JosefinSans', fontSize: 40)),
        SizedBox(
          height: 60,
        ),
        Center(
          child: Flex(
            mainAxisSize: MainAxisSize.min,
            direction: direction,
            children: [
              Flexible(
                flex: 3,
                fit: fit,
                child: Image.asset("assets/community/people.png"),
              ),
              Flexible(
                  flex: 1,
                  fit: fit,
                  child: SizedBox(
                    width: separtorWidth.toDouble(),
                    height: separtorHeight.toDouble(),
                  )),
              Flexible(
                flex: 2,
                fit: fit,
                child: Image.asset("assets/community/coming_soon.png"),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
