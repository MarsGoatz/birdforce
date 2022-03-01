import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/screens/common/person_details.dart';

class GuestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Ambassadors',
      message:
          'A special mention to our ambassadors who take time off of their busy schedule to empower our Flutter Canada community either by giving talks or help us with getting our word out there by sharing on social media.',
      items: [
        FlexResponsiveItem(
            flex: 5,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/roaa.png?alt=media&token=bdd74394-a415-49f8-88d3-a6ee88e3e82b",
              name: 'Roaa Khaddam',
              message: 'Flutter Developer & Co-founder @ multicaret',
              twitterHandle: 'https://mobile.twitter.com/roaakdm',
              mediumLink: 'https://medium.com/@roaakdm',
              webLink: 'https://multicaret.com',

              /*placeholder for Randal to fill in extra details*/

              // linkedInHandle: null,
              // email: null,
            )),
        FlexResponsiveItem(
            flex: 5,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/randal.png?alt=media&token=e8768b28-e674-41a7-b2dc-fd7cd1570d3d",
              name: 'Randal Schwartz',
              message: 'a.k.a. Merlyn, Flutter GDE',
              twitterHandle: 'https://twitter.com/RandalSchwartz',

              /*placeholder for Randal to fill in extra details*/

              // linkedInHandle: null,
              // email: null,
              // mediumLink: null,
              // webLink: null,
            )),
        FlexResponsiveItem(
            flex: 5,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/kevin.png?alt=media&token=93d18763-22a7-427c-a246-807254ea66de",
              name: 'Kevin Moore',
              message: 'Product Manager, Flutter & Dart, Google',
              twitterHandle: 'https://twitter.com/kevmoo',

              /*placeholder for Kevin to fill in extra details*/

              // linkedInHandle: null,
              // email: null,
              // mediumLink: null,
              // webLink: null,
            )),
      ],
    );
  }
}

class GuestCard2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexResponsive(
      items: [
        FlexResponsiveItem(
          flex: 5,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/aswin.png?alt=media&token=c016085c-6a4a-4b4a-9d8c-d52dcacc81e2",
            name: 'Aswin Gopinathan',
            message: 'Flutter Developer & Content Creator',
            twitterHandle: 'https://twitter.com/GopinathanAswin',

            /*placeholder for Aswin to fill in extra details*/

            linkedInHandle:
                'https://www.linkedin.com/in/aswin-gopinathan-69556716a/',
            email: 'aswingopinathan1871@gmail.com',
            mediumLink: 'https://dev.to/infiniteoverflow',
            // webLink: null,
          ),
        ),
        FlexResponsiveItem(
          flex: 5,
          child: PersonDetails(
            networkImageUrl:
                "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/fernando.png?alt=media&token=8ada1be9-1270-4dd8-8421-a5523e1deeef",
            name: 'Fernando Rocha',
            message: 'Senior Solutions Architect, AWS Amplify, Amazon',
            twitterHandle: 'https://twitter.com/rochatron',
            linkedInHandle: "https://www.linkedin.com/in/fernandorochas",
            email: null,
            mediumLink: null,
            webLink: null,
          ),
        ),
      ],
    );
  }
}
