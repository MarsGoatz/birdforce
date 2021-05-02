import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/screens/common/person_details.dart';

class ContributorsCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Contributors',
      message:
          'Members who have contributed to the community in one or another way!',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/kirk.jpg?alt=media&token=16b09e21-950c-45e7-80e8-29bf5508aa0a",
              name: 'Kirk Wight',
              message: 'Senior Software Engineer and team lead at Automattic',
              webLink: 'https://kwight.ca',
              twitterHandle: 'kwight',
              email: 'kwight@kwight.ca',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/cal.jpg?alt=media&token=e6954d37-17ce-4201-b85f-eee82f75cb82",
              name: 'Calvin Holloway',
              message: 'Founder, Hippie Inc.',
              webLink: 'https://www.goodkarma.ai',
              email: 'cal@hippie.app',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/jeff.jpg?alt=media&token=d6209663-8a7c-41c0-9294-ac475d370d1f",
              name: 'Jeffrey Bunn',
              message: 'Co-Founder, Clearful Journal',
              webLink: 'https://www.clearful.com',
              email: 'jeff@jeffreybunn.com',
            )),
      ],
    );
  }
}
