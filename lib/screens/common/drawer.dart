import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class DrawerResponsive extends StatelessWidget {
  const DrawerResponsive({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: BoxDecoration(
            gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color(0x00434343),
            Color(0x00000000),
          ],
        )),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Menu',
                style: TextStyle(fontFamily: 'roboto', fontSize: 30),
              ),
              decoration: BoxDecoration(
                  color: Colors.black,
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      Color(0xff09203f),
                      Color(0xff537895),
                    ],
                  )),
            ),
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
                    // Navigator.of(context, rootNavigator: true).pop();
                    return Navigator.popUntil(
                        context, (route) => route.isFirst);
                  } else {
                    Navigator.of(context).pop();
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
                    Navigator.popAndPushNamed(context, '/about');
                  } else {
                    Navigator.pop(context);
                  }
                },
              ),
            ),
            SizedBox(
              width: 10,
            )
          ],
        ),
      ),
    );
  }
}
