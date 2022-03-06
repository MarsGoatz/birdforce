import 'package:flutter/widgets.dart';

class MouseRegionSpan extends WidgetSpan {
  MouseRegionSpan({
    required MouseCursor mouseCursor,
    required InlineSpan inlineSpan,
  }) : super(
          child: MouseRegion(
            cursor: mouseCursor,
            child: Text.rich(
              inlineSpan,
            ),
          ),
        );
}
