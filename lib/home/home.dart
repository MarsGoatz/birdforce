import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vancouver/common/mouse_region_span.dart';
import 'package:flutter_vancouver/common/ui/app_bar.dart';
import 'package:flutter_vancouver/common/ui/footer.dart';
import 'package:flutter_vancouver/home/community.dart';
import 'package:flutter_vancouver/home/join_us.dart';
import 'package:flutter_vancouver/home/mission.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  ScrollController _pageScrollController;
  Text title;

  @override
  void initState() {
    super.initState();

    _pageScrollController = ScrollController();

    _titleController();
  }

  @override
  void dispose() {
    _pageScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding =
        MediaQuery.of(context).size.width < 800 ? 50 : 150;
    double verticalPadding = 50;
    double titleFont = MediaQuery.of(context).size.width > 960 ? 125 : 60;
    double navigationHeaderIconSize =
        MediaQuery.of(context).size.width < 400 ? 25 : 30;

    return Material(
      child: Scrollbar(
        isAlwaysShown: true,
        controller: _pageScrollController,
        child: CustomScrollView(
          controller: _pageScrollController,
          scrollDirection: Axis.vertical,
          slivers: [
            FvAppBar(
                title: title,
                titleFont: titleFont,
                navigationHeaderIconSize: navigationHeaderIconSize),
            SliverList(
              delegate: SliverChildListDelegate(
                [
                  Material(
                    color: Colors.amber[800].withOpacity(0.8),
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 12),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Center(
                            child: RichText(
                          textAlign: TextAlign.center,
                          text: new TextSpan(
                            children: [
                              new TextSpan(
                                text: 'New to Flutter? Watch the 2 min ',
                                style: TextStyle(
                                    fontFamily: 'SourceCodePro',
                                    fontSize: 20,
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                              MouseRegionSpan(
                                mouseCursor: SystemMouseCursors.click,
                                inlineSpan: TextSpan(
                                  text: 'animation',
                                  style: TextStyle(
                                      fontFamily: 'SourceCodePro',
                                      fontSize: 20,
                                      color: Colors.black,
                                      decoration: TextDecoration.underline,
                                      fontWeight: FontWeight.bold),
                                  recognizer: new TapGestureRecognizer()
                                    ..onTap = () {
                                      launch(
                                          'https://www.youtube.com/watch?v=fq4N0hgOWzU');
                                    },
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(
                                    fontFamily: 'Roboto',
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        )),
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.grey[850],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: Mission(),
                    ),
                  ),
                  Material(
                      color: Colors.grey[900],
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: verticalPadding),
                        child: JoinUs(),
                      )),
                  Material(
                      color: Colors.black,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: verticalPadding),
                        child: Community(),
                      )),
                  Material(
                      color: Colors.grey[850],
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: horizontalPadding,
                            vertical: verticalPadding),
                        child: FvFooter(),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _titleController() {
    _pageScrollController.addListener(() {
      if (_pageScrollController.offset >=
          MediaQuery.of(context).size.height / 2) {
        setState(() {
          title = Text(
            "Flutter Vancouver",
            style: TextStyle(
              color: Colors.white,
            ),
          );
        });
      } else {
        setState(() {
          title = null;
        });
      }
    });
  }
}
