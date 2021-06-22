import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';
import 'package:url_launcher/url_launcher.dart';

class JoinUsLocal extends StatelessWidget {
  const JoinUsLocal({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexCard(
        title: 'Local Community',
        message:
            'All our events are managed via Meetup. Here you you can RSVP and get notifications about our latest events.',
        items: [
          FlexResponsiveItem(
              flex: 2,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  MouseRegion(
                    cursor: SystemMouseCursors.click,
                    child: GestureDetector(
                      onTap: () =>
                          launch('https://www.meetup.com/Flutter-Vancouver/'),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Image.asset(
                          "assets/vancouver.png",
                          height: 350,
                          width: 350,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  OutlineButton(
                      padding: EdgeInsets.all(16),
                      borderSide: BorderSide(width: 2.0, color: Colors.red),
                      color: Colors.redAccent,
                      onPressed: () {
                        launch('https://www.meetup.com/Flutter-Vancouver/');
                      },
                      child: Text(
                        'Vancouver',
                        style: StyleConstants.kButtonTextStyle,
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
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
                      onTap: () =>
                          launch('https://www.meetup.com/Flutter-Vancouver/'),
                      child: Image.asset(
                        "assets/toronto.png",
                        height: 350,
                        width: 350,
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  OutlineButton(
                      padding: EdgeInsets.all(16),
                      borderSide: BorderSide(width: 2.0, color: Colors.red),
                      color: Colors.redAccent,
                      onPressed: () {
                        launch('https://www.meetup.com/Flutter-Toronto-group/');
                      },
                      child: Text(
                        'Toronto',
                        style: StyleConstants.kButtonTextStyle,
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ],
              )),
        ]);
  }
}
