import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vancouver_flutter_group_web/common/style_constants.dart';

class FvAppBar extends StatelessWidget {
  const FvAppBar({
    Key key,
    @required this.title,
  }) : super(key: key);

  final Text title;

  @override
  Widget build(BuildContext context) {
    double titleFont = MediaQuery.of(context).size.width > 960 ? 125 : 60;
    double navigationHeaderIconSize =
        MediaQuery.of(context).size.width < 400 ? 15 : 30;
    return SliverAppBar(
      leading: Image.asset("logo.png"),
      actions: [
        GestureDetector(
            child: Padding(
              padding: EdgeInsets.all(10),
              child: Icon(
                FontAwesomeIcons.bullhorn,
                size: navigationHeaderIconSize,
              ),
            ),
            onTap: () => Navigator.pushNamed(context, '/announcements')),
        GestureDetector(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: Icon(
              FontAwesomeIcons.github,
              size: navigationHeaderIconSize,
            ),
          ),
          onTap: () => launch(
              'https://github.com/FlutterVancouver/flutter_vancouver_flutter_web'),
        )
      ],
      floating: true,
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: title,
        background: Stack(
          children: [
            ColorFiltered(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.40), BlendMode.darken),
              child: Image.asset(
                'assets/vancouver.jpg',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            ),
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Opacity(
                  opacity: 0.8,
                  child: FlutterLogo(
                    size: 400,
                  ),
                ),
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Flutter Vancouver",
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Roboto',
                                fontSize:
                                    titleFont, // 247 is the height of the F when the fontSize is 350, assuming device pixel ratio 1.0
                                fontWeight: FontWeight.w400,
                                textBaseline: TextBaseline.alphabetic,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Center(
                            child: Text(
                              "Open Source Community. Made In Vancouver.",
                              style: StyleConstants.kDefaultTextStyle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            )),
            Padding(
              padding: EdgeInsets.only(left: 0, bottom: 40),
              child: Align(
                alignment: Alignment.bottomCenter,
                child: Icon(
                  FontAwesomeIcons.chevronDown,
                  color: Colors.white,
                  size: 30,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
