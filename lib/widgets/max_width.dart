import 'package:flutter/widgets.dart';

class MaxWidth extends StatelessWidget {
  final Widget child;
  const MaxWidth({Key? key, required this.child}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: BoxConstraints(maxWidth: 1800),
        child: child,
      ),
    );
  }
}
