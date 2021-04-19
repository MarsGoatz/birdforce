import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({
    Key? key,
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
        Text('Join Us',
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
                flex: 2,
                fit: fit,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    MouseRegion(
                      cursor: SystemMouseCursors.click,
                      child: GestureDetector(
                        onTap: () => launch(
                            'https://join.slack.com/t/fluttervancouver/shared_invite/zt-dtlz4grr-mqfJO5cuH5Xq5PjHaqa4fQ'),
                        child: Image.asset(
                          "assets/slack_white.png",
                          height: 200,
                          width: 200,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    OutlineButton(
                        padding: EdgeInsets.all(16),
                        borderSide: BorderSide(width: 2.0, color: Colors.amber),
                        color: Colors.amber[850],
                        onPressed: () {
                          launch(
                              'https://join.slack.com/t/fluttervancouver/shared_invite/zt-dtlz4grr-mqfJO5cuH5Xq5PjHaqa4fQ');
                        },
                        child: Text(
                          'Slack',
                          style: StyleConstants.kButtonTextStyle,
                        ),
                        shape: new RoundedRectangleBorder(
                            borderRadius: new BorderRadius.circular(20.0)))
                  ],
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () => launch(
                              'https://www.meetup.com/meetup-group-eBaLiZyW'),
                          child: Image.asset(
                            "assets/meetup.png",
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      OutlineButton(
                          padding: EdgeInsets.all(16),
                          borderSide: BorderSide(width: 2.0, color: Colors.red),
                          color: Colors.redAccent,
                          onPressed: () {
                            launch(
                                'https://www.meetup.com/meetup-group-eBaLiZyW');
                          },
                          child: Text(
                            'Meetup',
                            style: StyleConstants.kButtonTextStyle,
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)))
                    ],
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
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      MouseRegion(
                        cursor: SystemMouseCursors.click,
                        child: GestureDetector(
                          onTap: () =>
                              launch('https://github.com/FlutterVancouver'),
                          child: Image.asset(
                            "assets/github.png",
                            height: 200,
                            width: 200,
                          ),
                        ),
                      ),
                      SizedBox(height: 20),
                      OutlineButton(
                          padding: EdgeInsets.all(16),
                          borderSide:
                              BorderSide(width: 2.0, color: Colors.cyan),
                          color: Colors.cyanAccent,
                          onPressed: () {
                            launch('https://github.com/FlutterVancouver');
                          },
                          child: Text(
                            'Github',
                            style: StyleConstants.kButtonTextStyle,
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(20.0)))
                    ],
                  )),
            ],
          ),
        ),
      ],
    );
  }
}
