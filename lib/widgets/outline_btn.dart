import 'package:flutter/material.dart';
import 'package:flutter_vancouver/styles/style_constants.dart';

class OutlineCustomButton extends StatelessWidget {
  final Color borderColor;
  final String text;
  final VoidCallback onPressed;

  const OutlineCustomButton(
      {Key? key,
      required this.borderColor,
      required this.onPressed,
      required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
              primary: Colors.white,
              padding: EdgeInsets.symmetric(vertical: 18, horizontal: 10.0),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(22.0)))
          .copyWith(side: MaterialStateProperty.resolveWith((states) {
        final Color color = states.contains(MaterialState.pressed)
            ? Theme.of(context).colorScheme.primary
            : borderColor;
        return BorderSide(color: color, width: 2.0);
      })),
      onPressed: onPressed,
      child: Text(
        text,
        style: StyleConstants.kButtonTextStyle,
      ),
    );
  }
}
