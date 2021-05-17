import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_Canada/widgets/flex_card.dart';
import 'package:flutter_Canada/widgets/flex_repsonsive.dart';
import 'package:flutter_Canada/screens/common/person_details.dart';

class AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'About',
      message:
          'Flutter Canada was created by Siddharth Molleti after falling in love with Flutter and his interest for creating a community and teaching others came together. In addition to being a speaker, Sid actively maintains and organizes events in the community. If you are interested in being co-organizer, please reach out!',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/sid.png?alt=media&token=f13cccbc-f093-4f60-829c-3b4cee60e4f2",
              name: 'Siddharth Molleti',
              message: 'Organizer & Software Developer',
              twitterHandle: 'https://twitter.com/marsgoatzz',
              linkedInHandle: 'https://www.linkedin.com/in/smllti',
              email: 'sid.310@icloud.com',
              mediumLink: 'https://marsgoat.medium.com/',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              name: 'Your Name',
              message:
                  'As an organizer, you will create, host and promote events.',
              email: 'admin@fluttervancouver.ca',
            )),
      ],
    );
  }
}
