import 'package:flutter/material.dart';

class CounterViewModel with ChangeNotifier {
  // private 접근 제한을 갖는 int 형 변수를 선언하고
  // get 또는 set 을 선언한다.
  int _counter = 0;
  int get counter => _counter;
  void increment() {
    _counter++;

    // 어디선가 counter 변수를 화면에 그리고 있으면
    // counter 변수 값이 변경되었음을 공지하는 함수
    notifyListeners(); // State 클래스의 setState() 함수 역할을 수행
  }
}
