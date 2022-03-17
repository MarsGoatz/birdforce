import 'package:flutter/material.dart';
import 'package:url_strategy/url_strategy.dart';

import 'entry/fv_app.dart';

void main() {
  setPathUrlStrategy();
  runApp(FvApp());
}
