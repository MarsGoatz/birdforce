import 'package:flutter/material.dart';

import 'package:flutter_vancouver/screens/about/child_widgets/ambassador_card.dart';
import 'package:flutter_vancouver/screens/common/app_bar.dart';
import 'package:flutter_vancouver/screens/common/drawer.dart';
import 'package:flutter_vancouver/screens/common/footer.dart';
import 'package:flutter_vancouver/screens/common/title.dart';

import 'child_widgets/about_card.dart';
import 'child_widgets/open_source_card.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> {
  ScrollController _pageScrollController = ScrollController();

  @override
  void initState() {
    super.initState();
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

    double topContributorsPadding =
        MediaQuery.of(context).size.width < 800 ? 15 : 40;

    double borderWidth = MediaQuery.of(context).size.width < 800 ? 1.5 : 4;
    double borderRadius = MediaQuery.of(context).size.width < 800 ? 2.5 : 5;

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
              title: FvTitle(),
            ),
            SliverToBoxAdapter(
              child: ListView(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                children: [
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
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GuestCard(),
                          SizedBox(height: 40),
                          GuestCard2(),
                        ],
                      ),
                    ),
                  ),
                  Material(
                    color: Colors.grey[850],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding / 2,
                          vertical: verticalPadding),
                      child: Container(
                          decoration: BoxDecoration(
                            // color: Colors.orange,
                            border: Border.all(
                                width: borderWidth, color: Colors.redAccent),
                            borderRadius:
                                BorderRadius.all(Radius.circular(borderRadius)),
                          ),
                          child: Material(
                            color: Colors.black,
                            child: Padding(
                              padding: EdgeInsets.all(topContributorsPadding),
                              child: OpenSourceCard(),
                            ),
                          )),
                    ),
                  ),
                  Material(
                    color: Colors.grey[900],
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: horizontalPadding,
                          vertical: verticalPadding),
                      child: FvFooter(),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
