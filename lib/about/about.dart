import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vancouver/about/about_card.dart';
import 'package:flutter_vancouver/common/responsive_constants.dart';
import 'package:flutter_vancouver/common/ui/drawer.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_vancouver/common/ui/app_bar.dart';
import 'package:flutter_vancouver/common/ui/footer.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
  ScrollController _pageScrollController;
  Text title;

  @override
  void initState() {
    super.initState();

    _pageScrollController = ScrollController();

    title = Text(
      "Flutter Vancouver",
      style: TextStyle(
        color: Colors.white,
      ),
    );
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
      endDrawer:
          FvAppBar.shouldShowNavOptions(context) ? null : DrawerResponsive(),
      body: Scrollbar(
        isAlwaysShown: _pageScrollController.hasClients &&
                _pageScrollController.offset > 10
            ? true
            : false,
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
                    color: Colors.grey[850],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: AboutCard(),
                    ),
                  ),
                  Material(
                    color: Colors.grey[900],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: GuestCard(),
                    ),
                  ),
                  Material(
                    color: Colors.black,
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: MentorCard(),
                    ),
                  ),
                  Material(
                    color: Colors.grey[900],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: ContributorsCard(),
                    ),
                  ),
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
            Color(0xff6a11cb),
            Color(0xff2575fc),
          ],
        )),
        child: Stack(
          children: [
            Center(
                child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
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
