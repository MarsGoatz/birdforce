import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    double padding = MediaQuery.of(context).size.width < 800 ? 50 : 100;
    double expandedHeight = MediaQuery.of(context).size.width < 800 ? 150 : 300;
    double titleFont = MediaQuery.of(context).size.width < 800 ? 20 : 40;
    double navigationHeaderIconSize =
        MediaQuery.of(context).size.width < 400 ? 15 : 30;

    return Material(
      child: Scrollbar(
        controller: ScrollController(),
        isAlwaysShown: true,
        child: CustomScrollView(
          scrollDirection: Axis.vertical,
          slivers: [
            SliverAppBar(
              actions: [
                GestureDetector(
                    child: Padding(
                      padding: EdgeInsets.all(10),
                      child: Icon(
                        FontAwesomeIcons.bullhorn,
                        size: navigationHeaderIconSize,
                      ),
                    ),
                    onTap: () =>
                        Navigator.pushNamed(context, '/announcements')),
                GestureDetector(
                  child: Padding(
                    padding: EdgeInsets.all(10),
                    child: Icon(
                      FontAwesomeIcons.github,
                      size: navigationHeaderIconSize,
                    ),
                  ),
                  onTap: () => launch(
                      'https://github.com/FlutterVancouver/flutter_vancouver_flutter_web'),
                )
              ],
              floating: true,
              pinned: true,
              expandedHeight: expandedHeight,
              flexibleSpace: FlexibleSpaceBar(
                background: FlutterLogo(),
                title: Text('Flutter Vancouver Group',
                    style: GoogleFonts.josefinSans(fontSize: titleFont)),
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
