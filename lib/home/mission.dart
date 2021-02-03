import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vancouver_flutter_group_web/common/style_constants.dart';

class Mission extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text('Mission',
                textAlign: TextAlign.left,
                style: GoogleFonts.josefinSans(fontSize: 40)),
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
          'Flutter is an UI framework by Google to design and build beautiful mobile, web and desktop apps from a single codebase at lightening fast speeds. Vancouver Flutter Group is formed to bring people together who are using Flutter to create beautiful apps, looking to learn mobile development and making lasting connections.',
          style: StyleConstants.kDefaultTextStyle,
        ),
        SizedBox(
          height: 20,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 50.0),
          child: Row(
            children: [
              Expanded(
                  child: FvValue(
                asset: "assets/conference_call.svg",
                message:
                    'Regular meetups to discuss the current trends in Flutter and talks by members to make sure everyone is up to date with Flutter.',
              )),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network("assets/pair_programming.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'Find people to ask questions and work on projects together. Regular workshops and hackathons to keep you active with Flutter.',
                    style: StyleConstants.kDefaultTextStyle,
                  ),
                ],
              )),
              Expanded(
                  child: SizedBox(
                width: 10,
              )),
              Expanded(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.network("assets/open_source.svg"),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    'All our content along with the code is all open source and we will never ask you to pay anything. This community will always be open source.',
                    style: StyleConstants.kDefaultTextStyle,
                  ),
                ],
              )),
            ],
          ),
        )
      ],
    );
  }
}

class FvValue extends StatelessWidget {
  final String asset;
  final String message;

  const FvValue({
    Key key,
    this.asset,
    this.message,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.network(asset),
        SizedBox(
          height: 20,
        ),
        Text(
          message,
          style: StyleConstants.kDefaultTextStyle,
        ),
      ],
    );
  }
}
