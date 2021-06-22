import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinUsOnline extends StatelessWidget {
  const JoinUsOnline({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexCard(
        title: 'Online Community',
        message:
            'The hangout place for the community. We talk about performance tips, the latest news, state management and what not.',
        items: [
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
              ],
            ),
          ),
        ]);
  }
}
