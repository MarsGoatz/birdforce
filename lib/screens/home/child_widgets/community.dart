import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/widgets/flex_card.dart';
import 'package:flutter_vancouver/widgets/flex_repsonsive.dart';

class Community extends StatelessWidget {
  const Community({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FlexCard(items: [
      FlexResponsiveItem(
        flex: 3,
        child: Image.asset("assets/community/people.png"),
      ),
      FlexResponsiveItem(
        flex: 2,
        child: Image.asset("assets/community/coming_soon.png"),
      ),
    ], title: 'Community');
  }
}
