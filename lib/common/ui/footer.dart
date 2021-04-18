import 'package:flutter/widgets.dart';
import 'package:flutter_vancouver/common/responsive_constants.dart';
import 'package:flutter_vancouver/common/style_constants.dart';

class FvFooter extends StatelessWidget {
  const FvFooter({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontSize = MediaQuery.of(context).size.width < 500 ? 12 : 18;
    return Center(
      child: Column(
        children: [
          Text(
            'Flutter Vancouver',
            style: StyleConstants.kMissionTextStyle,
          ),
          Flex(
            direction: ResponsiveConstants.getAxis(context),
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Open Source Community. ',
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    fontSize: fontSize.roundToDouble(),
                    height: 1.3),
              ),
              Text(
                'Made In Vancouver.',
                maxLines: 1,
                style: TextStyle(
                    fontFamily: 'SourceCodePro',
                    fontSize: fontSize.roundToDouble(),
                    height: 1.3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
