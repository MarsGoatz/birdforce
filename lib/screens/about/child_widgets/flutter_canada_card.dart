import 'package:flutter/material.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:url_launcher/url_launcher.dart';

class FluterCanadaCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Flutter Canada',
      message: 'Flutter Vancouver has now moved to Flutter Canada!',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MouseRegion(
                  cursor: SystemMouseCursors.click,
                  child: GestureDetector(
                    onTap: () => launch('https://fluttercanada.ca'),
                    child: Image.asset(
                      "assets/flutter_can.png",
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0),
                  child: OutlineButton(
                      padding: EdgeInsets.all(16),
                      borderSide: BorderSide(width: 2.0, color: Colors.red),
                      color: Colors.redAccent,
                      onPressed: () {
                        launch('https://fluttercanada.ca');
                      },
                      child: Text(
                        'Launch',
                        style: StyleConstants.kButtonTextStyle,
                      ),
                      shape: new RoundedRectangleBorder(
                          borderRadius: new BorderRadius.circular(20.0))),
                ),
              ],
            )),
      ],
    );
  }
}
