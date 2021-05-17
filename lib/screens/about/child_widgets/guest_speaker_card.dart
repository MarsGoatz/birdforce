import 'package:flutter/material.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';
import 'package:flutter_vancouver/screens/common/person_details.dart';

class GuestCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlexCard(
      title: 'Guest Speakers',
      message:
          'A special mention to our speakers who take time off of their busy schedule to empower our Flutter Canada community.',
      items: [
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/fernando.png?alt=media&token=be542152-d4b5-44d6-b82e-06bf61cfd434",
              name: 'Fernando Rocha',
              message: 'Solutions Architect, AWS Amplify, Amazon',
              twitterHandle: 'https://twitter.com/rochatron',
              email: 'fernandorsl@gmail.com',
            )),
        FlexResponsiveItem(
            flex: 2,
            child: PersonDetails(
              networkImageUrl:
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/kevin.jpg?alt=media&token=fbeb9e8f-3c01-45e6-9dc7-7d8d094e8628",
              name: 'Kevin Moore',
              message: 'Product Manager, Flutter & Dart, Google',
              twitterHandle: 'https://twitter.com/kevmoo',
            )),
      ],
    );
  }
}
