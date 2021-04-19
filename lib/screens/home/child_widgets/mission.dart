import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/screens/common/flex_card.dart';
import 'package:flutter_vancouver/screens/common/flex_repsonsive.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';

class Mission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Mission',
      messageImage: 'assets/goals.png',
      message:
          'Flutter is an UI framework by Google to design and build beautiful mobile, web and desktop apps from a single codebase at lightning fast speeds. Vancouver Flutter Group is formed to bring people together who are using Flutter to create beautiful apps, looking to learn mobile development and making lasting connections',
      items: [
        FlexResponsiveItem(
          flex: 2,
          child: FvValue(
            asset: "assets/conference_call.png",
            message:
                'Regular meetups to discuss the current trends in Flutter and talks by members to make sure everyone is up to date with Flutter.',
          ),
        ),
        FlexResponsiveItem(
          flex: 2,
          child: FvValue(
            asset: "assets/pair_programming.png",
            message:
                'Find people to ask questions and work on projects together. Regular workshops and hackathons to keep your Flutter skills sharp.',
          ),
        ),
        FlexResponsiveItem(
          flex: 2,
          child: FvValue(
            asset: "assets/open_source.png",
            message:
                'All our content(except for third party and sensitive data) is all open source and there will never be any membership dues.',
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
