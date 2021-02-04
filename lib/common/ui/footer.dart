import 'package:flutter/widgets.dart';
import 'package:vancouver_flutter_group_web/common/style_constants.dart';

class FvFooter extends StatelessWidget {
  const FvFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Flutter Vancouver',
          style: StyleConstants.kMissionTextStyle,
        ),
        Text(
          'Open Source Community. Made In Vancouver.',
          style: StyleConstants.kDefaultTextStyle,
        )
      ],
    );
  }
}
