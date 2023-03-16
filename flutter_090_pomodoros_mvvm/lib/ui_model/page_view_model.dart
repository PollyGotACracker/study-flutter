import 'package:flutter/material.dart';

class PageViewModel with ChangeNotifier {
  final _pageController = PageController(initialPage: 0);
  get pageController => _pageController;

  // 객체지향 프로그래밍에서
  // 변수는 private 은닉하고, 외부에서 접근할 때는 getter, setter 를
  // 사용하는 전통적인 방법
  int _pageIndex = 0;
  get pageIndex => _pageIndex;
  void pageViewChange(newPageIndex) {
    _pageIndex = newPageIndex;
    notifyListeners();
  }

  void bottomNavTap(pageIndex) {
    _pageController.animateToPage(
      _pageIndex,
      duration: const Duration(seconds: 1),
      curve: Curves.ease,
    );
    // notifyListeners();
  }
}
