import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:vancouver_flutter_group_web/common/style_constants.dart';
import 'package:vancouver_flutter_group_web/common/ui/app_bar.dart';
import 'package:vancouver_flutter_group_web/common/ui/footer.dart';
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
