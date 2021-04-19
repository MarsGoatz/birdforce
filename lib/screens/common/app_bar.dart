import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FvAppBar extends StatelessWidget {
  const FvAppBar({
    Key? key,
    this.title,
    this.flexibleSpaceBar,
  }) : super(key: key);

  final Widget? title;
  final Widget? flexibleSpaceBar;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      leading: Padding(
        padding: const EdgeInsets.all(13.0),
        child: FlutterLogo(
          size: 15,
        ),
      ),
      actions: !shouldShowNavOptions(context) ? null : _navOptions(context),
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

  List<Widget> _navOptions(BuildContext context) {
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: TextButton(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Row(
              children: [
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
            if (Uri.base.pathSegments.isEmpty) {
              Navigator.pushNamed(context, '/about');
            }
          },
        ),
      ),
      SizedBox(
        width: 10,
      )
    ];
  }
}
