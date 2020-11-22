import 'package:flutter/material.dart';
import 'package:vancouver_flutter_group_web/announcements/announcements.dart';
import 'package:vancouver_flutter_group_web/home.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Vancouver Group',
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
