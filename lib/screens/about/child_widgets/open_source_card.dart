import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/widgets/outline_btn.dart';
import 'package:url_launcher/url_launcher.dart';

class OpenSourceCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Open Source Code',
      message:
          'Flutter Canada was forked from Flutter Vancouver\'s open source code. Feel free to check it out and contribute!',
      items: [
        FlexResponsiveItem(
          flex: 2,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              MouseRegion(
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTap: () => launch('https://github.com/MarsGoatz/birdforce'),
                  child: Image.asset(
                    "assets/github.png",
                    height: 200,
                    width: 200,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.only(left: 15.0),
                child: OutlineCustomButton(
                    borderColor: Colors.red,
                    onPressed: () =>
                        launch('https://github.com/MarsGoatz/birdforce'),
                    text: 'Github'),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
