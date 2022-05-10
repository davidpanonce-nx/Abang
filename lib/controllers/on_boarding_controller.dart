import 'package:abang/view/walkthrough%20screens/walkthrough_1.dart';
import 'package:abang/view/walkthrough%20screens/walkthrough_2.dart';
import 'package:abang/view/walkthrough%20screens/walkthrough_3.dart';
import 'package:abang/view/walkthrough%20screens/walkthrough_4.dart';
import 'package:flutter/material.dart';

class OnBoardingPageController extends ChangeNotifier {
  final List<Widget> _onBoardingScreens = [
    const WalkthroughPage1(),
    const WalkthroughPage2(),
    const WalkthroughPage3(),
    const WalkthroughPage4(),
  ];

  int _currentPageIndex = 0;

  List<Widget> get onBoardingScreens => _onBoardingScreens;
  int get currentPageIndex => _currentPageIndex;

  setCurrentPageIndex() {
    if (_currentPageIndex < 4) {
      _currentPageIndex++;
    }
    notifyListeners();
  }
}
