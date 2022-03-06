import 'package:flutter/material.dart';
import 'package:flutter_vancouver/screens/common/person_details.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';

class AboutCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'About',
      message:
          'Flutter Canada was created by Siddharth Molleti after falling in love with Flutter and the concept of "everything is a widget". Sid started the group in February 2020 and grew the community from ground up for two years from 0 to almost 500 people. Initially Sid started with hosting and giving talks in Vancouver and then expanded to Toronto at which point the community was rebranded to Flutter Canada. Alan joined as organizer on January 2022 and is now the current lead of the group and is taking the community to new heights. If you are interested in being an organizer, please reach out!',
      items: [
        FlexResponsiveItem(
          flex: 7,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/sid.png?alt=media&token=64e1f980-b690-49d5-b7ca-acfc9a5d67c9",
            name: 'Siddharth Molleti',
            message: 'Founder & Mentor',
            twitterHandle: 'https://twitter.com/marsgoatzz',
            linkedInHandle: 'https://www.linkedin.com/in/smllti',
            email: 'sid.310@icloud.com',
            mediumLink: 'https://marsgoat.medium.com/',
            webLink: 'https://marsgoat.com',
            borderColor: Colors.cyan,
          ),
        ),
        FlexResponsiveItem(
          flex: 7,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/alan.jpg?alt=media&token=81805921-5bd7-4ee6-93b6-5764ad281de5",
            name: 'Alan Hill',
            message: 'Lead Organizer',
            twitterHandle: 'https://twitter.com/iloveflutter',
            linkedInHandle: 'https://www.linkedin.com/in/alanjhill/',
            email: 'alan@octopology.com',
            mediumLink: 'https://medium.com/@alanjhill',
            webLink: null,
            borderColor: Colors.cyan,
          ),
        ),
        FlexResponsiveItem(
          flex: 7,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/sedwoo.png?alt=media&token=17da1cf7-04c5-4acc-9ba9-ba201ed530cb",
            name: 'Sebastian Dwornik',
            message: 'Co-Organizer',
            email: 'sebastian@appliedpda.com',
            mediumLink: null,
            twitterHandle: null,
            linkedInHandle: null,
            webLink: null,
            borderColor: Colors.cyan,
          ),
        ),
      ],
    );
  }
}

class AboutCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexResponsive(
      items: [
        FlexResponsiveItem(
          flex: 7,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/camilo.png?alt=media&token=cb7af92c-e726-4b7d-9768-26795d2f64a8",
            name: 'Camilo Rodriguez',
            message: 'Co-Organizer',
            email: 'camilo.andr3s@gmail.com',
            /*placeholder for Camilo to fill in additional details*/
            // mediumLink: null,
            // twitterHandle: null,
            // linkedInHandle: null,
            // webLink: null,
            borderColor: Colors.cyan,
          ),
        ),
        FlexResponsiveItem(
          flex: 7,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/donald.png?alt=media&token=bab21faf-a8c8-481a-a1a9-ae8c58688d98",
            name: 'Donald Murataj',
            message: 'Co-Organizer',
            email: 'donaldmurataj@gmail.com',
            /*placeholder for Donald to fill in extra details*/
            // twitterHandle: null,
            // linkedInHandle: null,
            // mediumLink: null,
            // webLink: null,
            borderColor: Colors.cyan,
          ),
        ),
        FlexResponsiveItem(
          flex: 7,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/willie.png?alt=media&token=e4d47369-6120-4ad9-ac92-9b5e8369c429",
            name: 'Qifeng Li(Willie)',
            message: 'Co-Organizer',
            email: 'qi.li1@ucalgary.ca',
            /*placeholder for Willie to fill in extra details*/
            // twitterHandle: null,
            // linkedInHandle: null,
            // mediumLink: null,
            // webLink: null,
            borderColor: Colors.cyan,
          ),
        ),
      ],
    );
  }
}
