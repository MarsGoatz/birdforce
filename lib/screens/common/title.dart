import 'package:flutter/material.dart';

class FvTitle extends StatelessWidget {
  const FvTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Flutter Vancouver",
      style: TextStyle(
        color: Colors.white,
      ),
    );
  }
}
