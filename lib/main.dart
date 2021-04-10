import 'package:flutter/material.dart';
import 'package:flutter_vancouver/about/about.dart';
import 'package:flutter_vancouver/common/no_transition_animation.dart';
import 'package:url_strategy/url_strategy.dart';
import 'package:flutter_vancouver/home/home.dart';

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
        pageTransitionsTheme: NoTransitionsOnWeb(),
        primarySwatch: Colors.amber,
        brightness: Brightness.dark,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      routes: {
        '/': (BuildContext context) => HomePage(),
        '/about': (BuildContext context) => AboutPage()
      },
    );
  }
}
