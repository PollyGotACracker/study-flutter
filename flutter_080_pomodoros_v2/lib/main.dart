import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_080_pomodoros_v2/pages/main_page.dart';

void main() {
  /**
   * main() => stateless => stateful => state 이러한 경로를 중간에 생략하는 경우
   * DataBinding 이 되는 경우
   * main() 함수에 App 초기화하는 코드들이 있는 경우
   * 
   * 이 속성을 추가해주는 것이 좋다.
   */
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const HomePage());
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const setCounter = 5;
  int _counter = setCounter;
  bool _timeRun = false;
  late Timer _timer;

  void _onPressed() {
    setState(() {
      _timeRun = !_timeRun;
    });
    if (_timeRun) {
      _timer = Timer.periodic(
          // Duration 으로 설정된 시간마다 callback 함수를 실행하라
          const Duration(seconds: 1),
          // callback 함수
          (timer) {
        setState(() {
          _counter--;
          if (_counter < 0) {
            _counter = setCounter;
            _timeRun = false;
            _timer.cancel();
          }
        });
      });
    } else {
      _timer.cancel();
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          fit: BoxFit.cover,
          image: AssetImage("images/background.jpg"),
        )),
        child: Scaffold(
          // background image 를 넣을 때는 color 를 transparent 로 설정
          backgroundColor: Colors.transparent,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [MainPage(counter: _counter)],
            ),
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.miniCenterFloat,
          floatingActionButton: SizedBox(
            width: 100,
            height: 100,
            child: FloatingActionButton(
              backgroundColor: Colors.white38,
              elevation: 5,
              onPressed: _onPressed,
              tooltip: 'Start',
              child: Icon(
                (_timeRun ? Icons.pause : Icons.play_arrow_rounded),
                size: 50,
                color: Colors.black,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
