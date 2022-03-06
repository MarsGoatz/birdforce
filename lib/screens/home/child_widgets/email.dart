import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:url_launcher/url_launcher.dart';

class Email extends StatelessWidget {
  final kEmail = 'leadership@fluttercanada.ca';
  const Email({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexCard(
        message:
            'If you are interested in contributing to the community, give a talk or any other questions in general, please reach out to us at:',
        items: [
          FlexResponsiveItem(
            flex: 5,
            child: Image.asset("assets/community/people.png"),
          ),
          FlexResponsiveItem(
            flex: 7,
            child: TextButton(
                style: OutlinedButton.styleFrom(
                  side: BorderSide(color: Colors.teal, width: 3),
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20))),
                ),
                child: Center(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      kEmail,
                      style: TextStyle(
                          fontFamily: 'SourceCodePro',
                          color: Colors.white,
                          fontSize: MediaQuery.of(context).size.width > 800
                              ? MediaQuery.of(context).size.width > 2000
                                  ? 45
                                  : MediaQuery.of(context).size.width / 50
                              : MediaQuery.of(context).size.width > 400
                                  ? MediaQuery.of(context).size.width / 30
                                  : MediaQuery.of(context).size.width / 34,
                          fontWeight: FontWeight.w300),
                    ),
                  ),
                ),
                onPressed: () => launch('mailto:$kEmail')),
          ),
        ],
        title: 'Contribute');
  }
}
