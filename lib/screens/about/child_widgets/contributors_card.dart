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
                  "https://firebasestorage.googleapis.com/v0/b/fluttervancity.appspot.com/o/chris.jpg?alt=media&token=401f5a21-b76e-4e41-8c78-0fec7d11802b",
              name: 'Chris V',
              message: 'Flutter Tinkerer',
              email: 'chris.vervaeke@gmail.com',
            )),
      ],
    );
  }
}
