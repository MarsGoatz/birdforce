import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_vancouver/about/about_card.dart';
import 'package:flutter_vancouver/common/ui/drawer.dart';
import 'package:flutter_vancouver/common/ui/app_bar.dart';
import 'package:flutter_vancouver/common/ui/footer.dart';

class AboutPage extends StatefulWidget {
  AboutPage({Key? key}) : super(key: key);

  @override
  _AboutPageState createState() => _AboutPageState();
}

class _AboutPageState extends State<AboutPage> with TickerProviderStateMixin {
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
              title: Text(
                "Flutter Vancouver",
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
            ),
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
