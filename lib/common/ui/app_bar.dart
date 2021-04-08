import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vancouver/common/responsive_constants.dart';

class FvAppBar extends StatelessWidget {
  const FvAppBar({
    Key key,
    this.title,
    this.titleFont,
    this.navigationHeaderIconSize,
  }) : super(key: key);

  final Text title;
  final double titleFont;
  final double navigationHeaderIconSize;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 400 ? 12 : 25;
    return SliverAppBar(
      leading: Image.asset("assets/logo.png"),
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
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height,
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: false,
        title: title != null
            ? Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    title,
                  ],
                ),
              )
            : title,
        background: Stack(
          children: [
            Image.network(
              'assets/vancity.png',
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
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
                        Center(
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Flutter Vancouver",
                                style: TextStyle(
                                  fontFamily: 'Roboto',
                                  color: Colors.white,
                                  fontSize: ResponsiveConstants.getTitleFont(
                                      context), // 247 is the height of the F when the fontSize is 350, assuming device pixel ratio 1.0
                                  fontWeight: FontWeight.w400,
                                  textBaseline: TextBaseline.alphabetic,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Flex(
                      mainAxisSize: MainAxisSize.min,
                      direction: ResponsiveConstants.getAxis(context),
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              " Tech Community",
                              style: TextStyle(
                                  fontFamily: 'SourceCodePro',
                                  color: Colors.grey[300],
                                  fontSize: ResponsiveConstants.getSubTitleFont(
                                      context),
                                  height: 1.3),
                            ),
                            Text(
                              " <_> ",
                              style: TextStyle(
                                  fontFamily: 'SourceCodePro',
                                  fontWeight: FontWeight.bold,
                                  fontSize: ResponsiveConstants.getSubTitleFont(
                                      context),
                                  height: 1.3,
                                  color: Colors.greenAccent[400]),
                            ),
                          ],
                        ),
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              "Made In Vancouver ",
                              style: TextStyle(
                                  fontFamily: 'SourceCodePro',
                                  color: Colors.grey[300],
                                  fontSize: ResponsiveConstants.getSubTitleFont(
                                      context),
                                  height: 1.3),
                            ),
                            Image.asset(
                              'assets/pixel_heart_canada_2.png',
                              width: 60,
                              height: 60,
                              fit: BoxFit.fill,
                            ),
                          ],
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
