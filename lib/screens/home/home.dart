import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_vancouver/screens/common/app_bar.dart';
import 'package:flutter_vancouver/screens/common/drawer.dart';
import 'package:flutter_vancouver/screens/common/footer.dart';
import 'package:flutter_vancouver/screens/common/title.dart';
import 'package:flutter_vancouver/screens/home/child_widgets/follow_us.dart';
import 'package:flutter_vancouver/screens/home/controller.dart';
import 'package:flutter_vancouver/styles/responsive_constants.dart';
import 'package:flutter_vancouver/widgets/mouse_region_span.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:provider/provider.dart';

import 'child_widgets/email.dart';
import 'child_widgets/join_us.dart';
import 'child_widgets/mission.dart';

class HomePage extends StatefulWidget {
  HomePage({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late ScrollController _pageScrollController;
  late AnimationController _controller;
  late Animation _paddingAnimation;
  late Animation _opacityAnimation;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(milliseconds: 1500),
      vsync: this,
    )..repeat(reverse: true);

    _paddingAnimation = Tween(begin: 20, end: 30.0)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller));
    _opacityAnimation = Tween(begin: 1, end: 0.2)
        .animate(CurvedAnimation(curve: Curves.linear, parent: _controller));

    _pageScrollController = ScrollController();
  }

  @override
  void dispose() {
    _pageScrollController.dispose();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double horizontalPadding =
        MediaQuery.of(context).size.width < 800 ? 50 : 150;
    double verticalPadding = 50;

    return ChangeNotifierProvider(
      create: (context) => HomeController(_pageScrollController, context),
      builder: (context, child) {
        return Scaffold(
          endDrawer: FvAppBar.shouldShowNavOptions(context)
              ? null
              : DrawerResponsive(),
          body: Scrollbar(
            isAlwaysShown: _shouldShowScrollbar,
            controller: _pageScrollController,
            child: CustomScrollView(
              controller: _pageScrollController,
              scrollDirection: Axis.vertical,
              slivers: [
                FvAppBar(
                  title: _shouldShowTitle(context) ? FvTitle() : null,
                  flexibleSpaceBar: HomeFlexibleSpacebar(
                    title: _shouldShowTitle(context) ? FvTitle() : null,
                    chevron: AnimatedBuilder(
                      animation: _controller,
                      builder: (BuildContext context, Widget? child) {
                        return Padding(
                          padding: EdgeInsets.all(_paddingAnimation.value),
                          child: IconButton(
                            onPressed: () => _pageScrollController.animateTo(
                                MediaQuery.of(context).size.height -
                                    kToolbarHeight,
                                duration: Duration(milliseconds: 300),
                                curve: Curves.easeIn),
                            icon: Center(
                              child: Icon(
                                FontAwesomeIcons.chevronDown,
                                color: Colors.tealAccent.withOpacity(
                                  _opacityAnimation.value,
                                ),
                                size: 30,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      Material(
                        color: Colors.amber[800]!.withOpacity(0.8),
                        child: Padding(
                          padding: EdgeInsets.symmetric(vertical: 12),
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
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
                            child: Email(),
                          )),
                      Material(
                          color: Colors.grey[900],
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: horizontalPadding,
                                vertical: verticalPadding),
                            child: FollowUs(),
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
      },
    );
  }

  bool get _shouldShowScrollbar {
    return _pageScrollController.hasClients &&
        _pageScrollController.offset > 10;
  }

  bool _shouldShowTitle(BuildContext context) {
    return Provider.of<HomeController>(context, listen: true).shouldShowTitle;
  }
}

class HomeFlexibleSpacebar extends StatelessWidget {
  final Widget? title;
  final AnimatedBuilder? chevron;

  const HomeFlexibleSpacebar({Key? key, this.title, this.chevron})
      : super(key: key);
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
                  title!,
                ],
              ),
            )
          : title,
      background: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
          colors: [
            Color(0xff4e4376),
            Color(0xff2b5876),
          ],
        )),
        child: Stack(
          children: [
            if (MediaQuery.of(context).size.width > 600 &&
                MediaQuery.of(context).size.height > 690)
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
                  FlutterLogo(
                    size: (MediaQuery.of(context).size.width > 600 &&
                            MediaQuery.of(context).size.height > 690)
                        ? 400
                        : 250,
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
                    MediaQuery.of(context).size.width > 800 &&
                            MediaQuery.of(context).size.height > 700
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
                        : Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Where the Vancouver Flutter community hangs out!",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontFamily: 'SourceCodePro',
                                  color: Colors.grey[350],
                                  fontSize: ResponsiveConstants.getSubTitleFont(
                                      context),
                                  height: 1.3),
                            ),
                          ),
                  ],
                )
              ],
            )),
            Align(
              alignment: Alignment.bottomCenter,
              child: chevron,
            )
          ],
        ),
      ),
    );
  }
}
