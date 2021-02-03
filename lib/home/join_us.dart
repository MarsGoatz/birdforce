import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vancouver_flutter_group_web/common/style_constants.dart';

class JoinUs extends StatelessWidget {
  const JoinUs({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Join Us',
            textAlign: TextAlign.left,
            style: GoogleFonts.josefinSans(fontSize: 40)),
        SizedBox(
          height: 60,
        ),
        Row(
          children: [
            SizedBox(width: 20),
            Expanded(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () => launch(
                          'https://join.slack.com/t/fluttervancouver/shared_invite/zt-dtlz4grr-mqfJO5cuH5Xq5PjHaqa4fQ'),
                      child: Image.asset(
                        "slack_white.png",
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
            SizedBox(width: 25),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () =>
                        launch('https://www.meetup.com/meetup-group-eBaLiZyW'),
                    child: Image.asset(
                      "meetup.png",
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
                        borderRadius: new BorderRadius.circular(20.0)))
              ],
            )),
            SizedBox(width: 20),
            Expanded(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launch(
                        'https://github.com/FlutterVancouver/flutter_vancouver_flutter_web'),
                    child: Image.asset(
                      "github.png",
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
                      launch(
                          'https://github.com/FlutterVancouver/flutter_vancouver_flutter_web');
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
      ],
    );
  }
}
