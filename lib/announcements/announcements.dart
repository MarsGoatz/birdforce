import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:http/http.dart' as http;

class Announcements extends StatefulWidget {
  @override
  _AnnouncementsState createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  final _targetFlutterFeedUrl =
      'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/flutter';
  var flutterJsonData;
  var flutterItems;

  final _targetDartFeedUrl =
      'https://api.rss2json.com/v1/api.json?rss_url=https://medium.com/feed/dartlang';
  var dartJsonData;
  var dartItems;

  @override
  void initState() {
    super.initState();
    http.read(_targetFlutterFeedUrl).then((jsonResponse) {
      setState(() {
        flutterJsonData = jsonDecode(jsonResponse);
        flutterItems = flutterJsonData['items'] as List;
      });
    });

    http.read(_targetDartFeedUrl).then((jsonResponse) {
      setState(() {
        dartJsonData = jsonDecode(jsonResponse);
        dartItems = dartJsonData['items'] as List;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    double _cardPadding = MediaQuery.of(context).size.width < 600 ? 10 : 50;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            'Announcements',
            style: GoogleFonts.josefinSans(),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Text(
                'Flutter',
                style: GoogleFonts.josefinSans(),
              )),
              Tab(
                  icon: Text(
                'Dart',
                style: GoogleFonts.josefinSans(),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: flutterJsonData == null
                  ? Center(child: CircularProgressIndicator())
                  : _buildListView(_cardPadding, flutterItems),
            ),
            Container(
              child: dartJsonData == null
                  ? Center(child: CircularProgressIndicator())
                  : _buildListView(_cardPadding, dartItems),
            ),
          ],
        ),
      ),
    );
  }
}

bool _isWithinOneWeek(String date) {
  var publishDate = DateTime.parse(date);
  return DateTime.now().difference(publishDate).inDays < 7;
}

ListView _buildListView(double cardPadding, List items) {
  return ListView.builder(
    padding: EdgeInsets.all(cardPadding),
    itemCount: items.length,
    itemBuilder: (BuildContext context, int index) {
      return Card(
        color: _isWithinOneWeek(items[index]['pubDate'])
            ? Colors.redAccent
            : Colors.transparent,
        elevation: _isWithinOneWeek(items[index]['pubDate']) ? 20 : 10,
        shadowColor: _isWithinOneWeek(items[index]['pubDate'])
            ? Colors.red
            : Colors.black,
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Visibility(
              visible: _isWithinOneWeek(items[index]['pubDate']),
              child: Container(
                width: double.infinity,
                color: Colors.redAccent,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                  child: Text(
                    'NEW UPDATE',
                    style: GoogleFonts.josefinSans(color: Colors.black),
                  ),
                ),
              ),
            ),
            ListTile(
              hoverColor: Colors.amberAccent,
              contentPadding: EdgeInsets.all(20.0),
              title: new Text(
                items[index]['title'],
                style: GoogleFonts.josefinSans(),
              ),
              subtitle: Text(items[index]['categories'].join(', ')),
              leading: new Image.network(
                items[index]['thumbnail'],
                fit: BoxFit.cover,
                height: 400.0,
                width: 50.0,
              ),
              onTap: () => launch(items[index]['link']),
            ),
          ],
        ),
      );
    },
  );
}
