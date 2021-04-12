import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/common/style_constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_vancouver/common/responsive_constants.dart';

class FvAppBar extends StatelessWidget {
  const FvAppBar({
    Key key,
    this.title,
    this.titleFont,
    this.navigationHeaderIconSize,
    this.flexibleSpaceBar,
  }) : super(key: key);

  final Text title;
  final double titleFont;
  final double navigationHeaderIconSize;
  final Widget flexibleSpaceBar;

  @override
  Widget build(BuildContext context) {
    double fontSize = MediaQuery.of(context).size.width > 400 ? 12 : 25;
    return SliverAppBar(
      leading: Image.asset("assets/logo.png"),
      actions: shouldShowNavOptions(context) ? navOptions(context) : null,
      pinned: true,
      title: flexibleSpaceBar != null ? null : title,
      centerTitle: false,
      expandedHeight:
          flexibleSpaceBar != null ? MediaQuery.of(context).size.height : 0,
      flexibleSpace: flexibleSpaceBar ??
          SizedBox(
            width: 0,
            height: 0,
          ),
    );
  }

  static bool shouldShowNavOptions(BuildContext context) {
    return (MediaQuery.of(context).size.width > 600 &&
        MediaQuery.of(context).size.height > 600);
  }

  static List<Widget> navOptions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
                // SizedBox(
                //   width: 4,
                // ),
                Icon(
                  Icons.home,
                  size: 21,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'Home',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
                SizedBox(
                  width: 2,
                ),
              ],
            ),
          ),
          onPressed: () {
            print('from home' + Uri.base.pathSegments.toString());
            if (Uri.base.pathSegments.isNotEmpty) {
              return Navigator.popUntil(context, (route) => route.isFirst);
            }
          },
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8),
        child: TextButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4),
            child: Row(
              children: [
                Icon(
                  Icons.info_outline,
                  size: 21,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  'About',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
          onPressed: () {
            print('from about' + Uri.base.pathSegments.toString());
            if (Uri.base.pathSegments.isEmpty) {
              return Navigator.pushNamed(context, '/about');
            }
          },
        ),
      ),
      // IconButton(
      //   padding: EdgeInsets.fromLTRB(0, 0, 8, 6),
      //   icon: Icon(
      //     FontAwesomeIcons.github,
      //     size: navigationHeaderIconSize,
      //   ),
      //   onPressed: () => launch('https://github.com/FlutterVancouver'),
      // )
      SizedBox(
        width: 10,
      )
    ];
  }
}
