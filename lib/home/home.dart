import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vancouver/common/responsive_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
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

    return Scaffold(
      endDrawer: FvAppBar.shouldShowNavOptions(context)
          ? null
          : Drawer(
              // Add a ListView to the drawer. This ensures the user can scroll
              // through the options in the drawer if there isn't enough vertical
              // space to fit everything.
              child: Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [
                    Color(0xff6a11cb),
                    Color(0xff2575fc),
                  ],
                )),
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: FvAppBar.navOptions(context),
                ),
              ),
            ),
      body: Scrollbar(
        isAlwaysShown: true,
        controller: _pageScrollController,
        child: CustomScrollView(
          controller: _pageScrollController,
          scrollDirection: Axis.vertical,
          slivers: [
            FvAppBar(
                title: title,
                titleFont: titleFont,
                flexibleSpaceBar: HomeFlexibleSpacebar(
                  title: title,
                ),
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

class HomeFlexibleSpacebar extends StatelessWidget {
  final Text title;

  const HomeFlexibleSpacebar({Key key, this.title}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return FlexibleSpaceBar(
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
      background: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0xffff9a44),
            Color(0xfffc6076),
          ],
        )),
        child: Stack(
          children: [
            if (MediaQuery.of(context).size.width > 600 &&
                MediaQuery.of(context).size.height > 600)
              Image.asset(
                'assets/vancity.png',
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                fit: BoxFit.cover,
              ),
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (MediaQuery.of(context).size.height > 600)
                  Opacity(
                    opacity: 0.8,
                    child: FlutterLogo(
                      size: (MediaQuery.of(context).size.width > 600 &&
                              MediaQuery.of(context).size.height > 600)
                          ? 400
                          : 250,
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
                    MediaQuery.of(context).size.width > 800
                        ? Flex(
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
                                        fontSize:
                                            ResponsiveConstants.getSubTitleFont(
                                                context),
                                        height: 1.3),
                                  ),
                                  Text(
                                    " <_> ",
                                    style: TextStyle(
                                        fontFamily: 'SourceCodePro',
                                        fontWeight: FontWeight.bold,
                                        fontSize:
                                            ResponsiveConstants.getSubTitleFont(
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
                                        fontSize:
                                            ResponsiveConstants.getSubTitleFont(
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
                          )
                        : Text(
                            "Where the Vancouver Flutter community hangs out!",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                fontFamily: 'SourceCodePro',
                                color: Colors.green[800],
                                fontSize: ResponsiveConstants.getSubTitleFont(
                                    context),
                                height: 1.3),
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
