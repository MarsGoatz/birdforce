import 'package:flutter/material.dart';

import '../animations/no_transition_animation.dart';
import '../screens/about/about.dart';
import '../screens/home/home.dart';

class FvApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Canada',
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
