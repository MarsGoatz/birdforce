import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/screens/common/person_details.dart';

class ActiveContributorsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Active Contributors',
      message:
          'These people go above and beyond by actively contributing to the community by either answering questions or even asking questions! A shout out to them!',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/boris.png?alt=media&token=a324a3f1-9fd6-48ee-9edc-cc312275beaf",
              name: 'Boris Schneiderman',
              message: 'Head of development at Potent Systems LLC',
              linkedInHandle:
                  'https://www.linkedin.com/in/boris-schneiderman-14986721',
              email: 'boris@bormind.com',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/lu.jpg?alt=media&token=fd2fd02c-317c-48eb-bdbf-dbff97279a5d",
              name: 'Lu Tang',
              message: 'Flutter Developer at various tech startups',
              twitterHandle: 'https://twitter.com/FlutterLulu',
              linkedInHandle: 'https://www.linkedin.com/in/lutang123/',
              email: 'lutang908@gmail.com',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/chris.jpg?alt=media&token=401f5a21-b76e-4e41-8c78-0fec7d11802b",
              name: 'Chris V',
              message: 'Flutter Tinkerer',
              email: 'chris.vervaeke@gmail.com',
            )),
      ],
    );
  }
}
