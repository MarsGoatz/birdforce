import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:vancouver_flutter_group_web/announcements.dart';

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
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: MyHomePage(title: 'Flutter Vancouver Group'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width < 600 ? 50 : 100;

    return Material(
      child: Scrollbar(
        isAlwaysShown: true,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              actions: [
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Icon(FontAwesomeIcons.bullhorn),
                  ),
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Announcements()))
                ),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Row(
                      children: [
                        Icon(FontAwesomeIcons.github),
                        SizedBox(width: 10),
                        Text('Fork On Github', style: GoogleFonts.josefinSans(fontSize: 20)),
                      ],
                    ),
                  ),
                  onTap: () => launch(
                              'https://github.com/FlutterVancouver/flutter_vancouver_flutter_web'),
                )
              ],
              floating: true,
              pinned: true,
              expandedHeight: 350.0,
              flexibleSpace: FlexibleSpaceBar(
                background: FlutterLogo(),
                title: Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Text('Flutter Vancouver Group',
                      style: GoogleFonts.josefinSans(fontSize: 30)),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('About',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.josefinSans(fontSize: 40)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      'Flutter is an UI framework by Google to design and build beautiful mobile, web and desktop apps from a single codebase at lightening fast speeds. Vancouver Flutter Group is formed to bring people together who are using Flutter to create beautiful apps, looking to learn mobile development and making lasting connections.',
                      style: GoogleFonts.roboto(fontSize: 18, height: 1.3),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Our Goals',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.josefinSans(fontSize: 40)),
                    SizedBox(
                      height: 20,
                    ),
                    Text(
                      '\u2022 Connect people who are using Flutter or looking to learn Flutter.',
                      style: GoogleFonts.roboto(fontSize: 18, height: 1.3),
                    ),
                    Text(
                        '\u2022 Help with faster onboarding to Flutter with helpful resources and hands on help.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.3)),
                    Text(
                        '\u2022 Connect people who are using Flutter or looking to learn Flutter.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.3)),
                    Text(
                        '\u2022 Inspire and motivate people to work on thier dream project.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.3)),
                    Text(
                        '\u2022 A place to talk about problems and brainstorm ideas.',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.roboto(fontSize: 18, height: 1.3)),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(padding),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Join Us',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.josefinSans(fontSize: 40),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Material(
                            child: IconButton(
                          icon: Icon(FontAwesomeIcons.slack),
                          onPressed: () => launch(
                              'https://join.slack.com/t/fluttervancouver/shared_invite/zt-dtlz4grr-mqfJO5cuH5Xq5PjHaqa4fQ'),
                        )),
                        SizedBox(width: 20),
                        Material(
                            child: IconButton(
                          icon: Icon(FontAwesomeIcons.meetup),
                          onPressed: () => launch(
                              'https://www.meetup.com/meetup-group-eBaLiZyW'),
                        ))
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
