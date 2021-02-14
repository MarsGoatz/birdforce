import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vancouver_flutter_group_web/common/mouse_region_span.dart';
import 'package:vancouver_flutter_group_web/common/ui/app_bar.dart';
import 'package:vancouver_flutter_group_web/common/ui/footer.dart';
import 'package:vancouver_flutter_group_web/home/community.dart';
import 'package:vancouver_flutter_group_web/home/join_us.dart';
import 'package:vancouver_flutter_group_web/home/mission.dart';

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
        MediaQuery.of(context).size.width < 400 ? 13 : 25;

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
                      child: Center(
                          child: RichText(
                        text: new TextSpan(
                          children: [
                            new TextSpan(
                              text:
                                  'New to Flutter? Watch the introductory video ',
                              style: GoogleFonts.sourceCodePro(
                                  fontSize: 20,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                            MouseRegionSpan(
                              mouseCursor: SystemMouseCursors.click,
                              inlineSpan: TextSpan(
                                text: 'here',
                                style: GoogleFonts.sourceCodePro(
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
                              style: GoogleFonts.roboto(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      )

                          // Text(
                          //   'New to Flutter? Watch the introductory video here.',
                          //   style: GoogleFonts.roboto(
                          //       color: Colors.black, fontWeight: FontWeight.bold),
                          // ),
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
