import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/screens/common/person_details.dart';

class AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'About',
      message:
          'Flutter Vancouver was created by Siddharth Molleti after falling in love with Flutter and his interest for creating a community and teaching others came together. In addition to being a speaker, Sid actively maintains and organizes events in the community. The next person to make an impact in the group is Boris Schneiderman. Boris has been involved since the beginning and is the Gandalf of our group. On top of having high standards for teaching others, when someone has a query, he goes above and beyond to help them. The group is very lucky to have him. Next up is Lu Tang, Lu is a self learner and and after working on different fields in tech industry, she chose Flutter as her career as she believes the value in Flutter. She is passionate about creating great software applications that bring values to our life and helping others to learn Flutter. She is truly an inspiration for women out there. All of us live and work in Vancouver.',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/sid.png?alt=media&token=f13cccbc-f093-4f60-829c-3b4cee60e4f2",
              name: 'Siddharth Molleti',
              message: 'Founder, Organizer & Software Developer',
              twitterHandle: 'https://twitter.com/marsgoatzz',
              linkedInHandle: 'https://www.linkedin.com/in/smllti',
              email: 'sid.310@icloud.com',
              mediumLink: 'https://marsgoat.medium.com/',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/boris.png?alt=media&token=a324a3f1-9fd6-48ee-9edc-cc312275beaf",
              name: 'Boris Schneiderman',
              message:
                  'Co-Organizer & Head of development at Potent Systems LLC',
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
              message:
                  'Co-Organizer & Flutter Developer at various tech startups',
              twitterHandle: 'https://twitter.com/FlutterLulu',
              linkedInHandle: 'https://www.linkedin.com/in/lutang123/',
              email: 'lutang908@gmail.com',
            )),
      ],
    );
  }
}
