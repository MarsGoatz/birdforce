import 'package:flutter/material.dart';

class HomeController with ChangeNotifier {
  bool _showTitle = false;
  late ScrollController _pageScrollController;

  bool get shouldShowTitle => _showTitle;

  HomeController(ScrollController scrollController, BuildContext context) {
    _pageScrollController = scrollController;
    _pageScrollController.addListener(() {
      if (_pageScrollController.offset >=
              MediaQuery.of(context).size.height / 2 &&
          !_showTitle) {
        _setTitle(true);
      } else if (_pageScrollController.offset <
              MediaQuery.of(context).size.height / 2 &&
          _showTitle) {
        _setTitle(false);
      }
    });
  }

  void _setTitle(bool value) {
    _showTitle = value;
    notifyListeners();
  }
}
