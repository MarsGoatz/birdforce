import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_Canada/widgets/flex_card.dart';
import 'package:flutter_Canada/widgets/flex_repsonsive.dart';
import 'package:flutter_Canada/styles/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexCard(title: 'Join Us', items: [
      FlexResponsiveItem(
        flex: 2,
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
                    borderRadius: new BorderRadius.circular(20.0))),
            SizedBox(height: 20),
            Text(
              'The hangout place for the community. We talk about performance tips, the latest news, state management and what not.',
              style: StyleConstants.kDefaultTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
      FlexResponsiveItem(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () =>
                      launch('https://www.meetup.com/meetup-group-eBaLiZyW'),
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
                    launch('https://www.meetup.com/meetup-group-eBaLiZyW');
                  },
                  child: Text(
                    'Meetup',
                    style: StyleConstants.kButtonTextStyle,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
              SizedBox(height: 20),
              Text(
                'All our events are managed via Meetup. Here you you can RSVP and get notifications about our latest events.',
                style: StyleConstants.kDefaultTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          )),
      FlexResponsiveItem(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launch('https://github.com/FlutterVancouver'),
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
                  borderSide: BorderSide(width: 2.0, color: Colors.cyan),
                  color: Colors.cyanAccent,
                  onPressed: () {
                    launch('https://github.com/FlutterVancouver');
                  },
                  child: Text(
                    'Github',
                    style: StyleConstants.kButtonTextStyle,
                  ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(20.0))),
              SizedBox(height: 20),
              Text(
                'Github is the place where we post our content related to our talks or any other code we want to share.',
                style: StyleConstants.kDefaultTextStyle,
                textAlign: TextAlign.center,
              ),
            ],
          )),
    ]);
  }
}
