import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:vancouver_flutter_group_web/announcements/announcements.dart';
import 'package:vancouver_flutter_group_web/home/home.dart';

void main() {
  setPathUrlStrategy();
  runApp(FvApp());
}

class FvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Vancouver',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/announcements': (BuildContext context) => Announcements(),
      },
    );
  }
}
