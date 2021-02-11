import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:vancouver_flutter_group_web/common/style_constants.dart';
import 'package:auto_size_text/auto_size_text.dart';

class FvFooter extends StatelessWidget {
  const FvFooter({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var fontSize = MediaQuery.of(context).size.width > 400 ? 12 : 18;
    return Center(
      child: Column(
        children: [
          Text(
            'Flutter Vancouver',
            style: StyleConstants.kMissionTextStyle,
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Text(
                'Open Source Community. Made In Vancouver.',
                maxLines: 1,
                style: GoogleFonts.sourceCodePro(
                    fontSize: fontSize.roundToDouble(), height: 1.3),
              ),
            ),
          )
        ],
      ),
    );
  }
}
