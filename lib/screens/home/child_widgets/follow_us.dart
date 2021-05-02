import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class FollowUs extends StatelessWidget {
  const FollowUs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexCard(title: 'Follow Us', items: [
      FlexResponsiveItem(
        flex: 2,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
            ),
            MouseRegion(
              cursor: SystemMouseCursors.click,
              child: GestureDetector(
                onTap: () => launch('https://twitter.com/FlutterVancity'),
                child: Image.asset(
                  "assets/social/twitter.png",
                  height: 120,
                  width: 120,
                ),
              ),
            ),
            SizedBox(
              height: 60,
            ),
            OutlineButton(
                padding: EdgeInsets.all(16),
                borderSide: BorderSide(width: 2.0, color: Colors.blue),
                color: Colors.amber[850],
                onPressed: () {
                  launch('hhttps://twitter.com/FlutterVancity');
                },
                child: Text(
                  'Twitter',
                  style: StyleConstants.kButtonTextStyle,
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
            SizedBox(height: 20),
            Text(
              'Follow us on Twitter where we always announce important information!',
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
                onTap: () => launch(
                    'https://www.youtube.com/channel/UCiBD1H_RTwWLyhUTPFFpFeA'),
                child: Image.asset(
                  "assets/social/youtube.png",
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
                borderSide: BorderSide(width: 2.0, color: Colors.red),
                color: Colors.red[850],
                onPressed: () {
                  launch(
                      'https://www.youtube.com/channel/UCiBD1H_RTwWLyhUTPFFpFeA');
                },
                child: Text(
                  'Youtube',
                  style: StyleConstants.kButtonTextStyle,
                ),
                shape: new RoundedRectangleBorder(
                    borderRadius: new BorderRadius.circular(20.0))),
            SizedBox(height: 20),
            Text(
              'Checkout our previous events. Like and subscribe!',
              style: StyleConstants.kDefaultTextStyle,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    ]);
  }
}
