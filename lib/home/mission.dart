import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/common/style_constants.dart';

class Mission extends StatelessWidget {
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
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mission',
                textAlign: TextAlign.left,
                style: TextStyle(fontFamily: 'JosefinSans', fontSize: 40)),
            Image.asset(
              'assets/goals.png',
              width: 80,
              height: 80,
            )
          ],
        ),
        SizedBox(
          height: 20,
        ),
        Text(
          'Flutter is an UI framework by Google to design and build beautiful mobile, web and desktop apps from a single codebase at lightning fast speeds. Vancouver Flutter Group is formed to bring people together who are using Flutter to create beautiful apps, looking to learn mobile development and making lasting connections.',
          style: StyleConstants.kDefaultTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Center(
            child: Flex(
              mainAxisSize: MainAxisSize.min,
              direction: direction,
              children: [
                Flexible(
                    flex: 2,
                    fit: fit,
                    child: FvValue(
                      asset: "assets/conference_call.png",
                      message:
                          'Regular meetups to discuss the current trends in Flutter and talks by members to make sure everyone is up to date with Flutter.',
                    )),
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
                  child: FvValue(
                    asset: "assets/pair_programming.png",
                    message:
                        'Find people to ask questions and work on projects together. Regular workshops and hackathons to keep your Flutter skills sharp.',
                  ),
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
                  child: FvValue(
                    asset: "assets/open_source.png",
                    message:
                        'All our content(except for third party and sensitive data) is all open source and there will never be any membership dues.',
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}

class FvValue extends StatelessWidget {
  @required
  final String? asset;
  @required
  final String? message;

  const FvValue({
    Key? key,
    this.asset,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: new BoxConstraints(
        maxWidth: 500.0,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ConstrainedBox(
              constraints: new BoxConstraints(
                maxHeight: 300.0,
                maxWidth: 300.0,
              ),
              child: Image.asset(asset!)),
          SizedBox(
            height: 20,
          ),
          Text(
            message!,
            style: StyleConstants.kDefaultTextStyle,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
