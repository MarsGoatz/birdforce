import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/widgets/outline_btn.dart';
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
                OutlineCustomButton(
                    borderColor: Colors.amber,
                    onPressed: () => launch(
                        'https://join.slack.com/t/fluttervancouver/shared_invite/zt-dtlz4grr-mqfJO5cuH5Xq5PjHaqa4fQ'),
                    text: 'Slack'),
              ],
            ),
          ),
        ]);
  }
}
