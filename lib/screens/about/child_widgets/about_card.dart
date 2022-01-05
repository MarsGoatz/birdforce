import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/screens/common/founder_details.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';

class AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'About',
      message:
          'Flutter Vancouver was created by Siddharth Molleti after falling in love with Flutter and his interest for creating a community and teaching others came together. In addition to being a speaker, Sid actively maintains and organizes events in the community. If you are interested in being co-organizer, please reach out!',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: OrganizerDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/sid.png?alt=media&token=f13cccbc-f093-4f60-829c-3b4cee60e4f2",
              name: 'Siddharth Molleti',
              message: 'Founder & Organizer',
              twitterHandle: 'https://twitter.com/marsgoatzz',
              linkedInHandle: 'https://www.linkedin.com/in/smllti',
              email: 'sid.310@icloud.com',
              mediumLink: 'https://marsgoat.medium.com/',
              webLink: 'https://marsgoat.com',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: OrganizerDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/alan.png?alt=media&token=8aabe801-f901-4241-86f3-a8f9f4a390d2",
              name: 'Alan Hill',
              message: 'Co-Organizer',
              twitterHandle: 'https://twitter.com/palge',
              //placeholder for Alan to fill his details if he wants to
              linkedInHandle: null,
              email: null,
              mediumLink: null,
              webLink: null,
            )),
      ],
    );
  }
}
