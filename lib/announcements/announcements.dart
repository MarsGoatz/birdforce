import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:gradient_widgets/gradient_widgets.dart';
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

  ScrollController _flutter = ScrollController();
  ScrollController _dart = ScrollController();

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
            style: TextStyle(fontFamily: 'JosefinSans'),
          ),
          bottom: TabBar(
            tabs: [
              Tab(
                  icon: Text(
                'Flutter',
                style: TextStyle(fontFamily: 'JosefinSans'),
              )),
              Tab(
                  icon: Text(
                'Dart',
                style: TextStyle(fontFamily: 'JosefinSans'),
              )),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Container(
              child: flutterJsonData == null
                  ? Center(child: CircularProgressIndicator())
                  : _buildListView(_cardPadding, flutterItems, _flutter),
            ),
            Container(
              child: dartJsonData == null
                  ? Center(child: CircularProgressIndicator())
                  : _buildListView(_cardPadding, dartItems, _dart),
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

Widget _buildListView(
    double cardPadding, List items, ScrollController scrollController) {
  return Scrollbar(
    controller: scrollController,
    isAlwaysShown: true,
    child: ListView.builder(
      padding: EdgeInsets.all(cardPadding),
      itemCount: items.length,
      itemBuilder: (BuildContext context, int index) {
        return Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              constraints: BoxConstraints(maxWidth: 800, minWidth: 400),
              child: GradientCard(
                gradient: _isWithinOneWeek(items[index]['pubDate'])
                    ? Gradients.coldLinear
                    : null,
                elevation: _isWithinOneWeek(items[index]['pubDate']) ? 20 : 10,
                margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Visibility(
                      visible: _isWithinOneWeek(items[index]['pubDate']),
                      child: Container(
                        decoration: BoxDecoration(
                          gradient: Gradients.coldLinear,
                        ),
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.fromLTRB(20, 20, 0, 10),
                          child: Text(
                            'NEW',
                            style: TextStyle(
                                fontFamily: 'JosefinSans', color: Colors.black),
                          ),
                        ),
                      ),
                    ),
                    ListTile(
                      tileColor: !_isWithinOneWeek(items[index]['pubDate'])
                          ? Colors.grey[900]
                          : null,
                      hoverColor: Colors.grey[900],
                      contentPadding: EdgeInsets.all(20.0),
                      title: new Text(
                        items[index]['title'],
                        style: TextStyle(fontFamily: 'JosefinSans'),
                      ),
                      subtitle: Text(items[index]['categories'].join(', ')),
                      leading: new Image.network(
                        items[index]['thumbnail'],
                        fit: BoxFit.fitHeight,
                        height: 400.0,
                        width: 100.0,
                      ),
                      onTap: () => launch(items[index]['link']),
                    ),
                  ],
                ),
              ),
            ),
          ],
        );
      },
    ),
  );
}
