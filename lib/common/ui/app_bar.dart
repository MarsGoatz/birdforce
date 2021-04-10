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
      actions: [
        IconButton(
          padding: EdgeInsets.fromLTRB(0, 0, 8, 6),
          icon: Icon(
            FontAwesomeIcons.github,
            size: navigationHeaderIconSize,
          ),
          onPressed: () => launch('https://github.com/FlutterVancouver'),
        )
      ],
      pinned: true,
      expandedHeight: MediaQuery.of(context).size.height,
      flexibleSpace: flexibleSpaceBar,
    );
  }
}
