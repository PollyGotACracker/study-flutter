import 'dart:async';

import 'package:duration_picker/duration_picker.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  // createState():
  // State 클래스의 _HomeScreenState 생성자 호출, State 반환
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // cf) const 와 final 의 차이
  // const 는 compile 시 이미 상수로 지정되어 있는 값
  // final 은 함수가 실행된고 반환하는 값을 상수로 고정
  static const minutes = 1500; // 1500: 25 * 60 = 1500s
  late int totalSeconds;
  late Duration? duration;
  bool isRunning = false;
  int totalCount = 0;
  // late: 선언만 하고 나중에 초기화
  late Timer timer;

  // setState((){}): statefulWidget 에 화면 변경을 알림
  // setState((){...}) 내부에 코드를 작성하거나, 코드 가장 아래에 setState((){}) 를 작성
  void onTick(Timer timer) {
    if (totalSeconds == 0) {
      setState(() {
        totalCount = totalCount + 1;
        isRunning = false;
        totalSeconds = duration!.inSeconds.toInt();
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds = totalSeconds - 1;
      });
    }
  }

  void onStartPressed() {
    // Timer.periodic: 일정 주기마다 callback 실행
    // Timer.periodic 의 callback 은 인자로 Timer 자체를 받아야 함
    // Duration(): 한 시점에서 다른 시점까지의 차이
    timer = Timer.periodic(const Duration(seconds: 1), onTick);
    // isRunning 값에 따라 버튼 이미지가 변경되므로 setState 사용
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onRestartPressed() {
    // if (!isRunning) {
    //   setState(() {
    //     totalSeconds = duration!.inSeconds.toInt();
    //   });
    // }
  }

  // var 는 기본적인 변수 선언 키워드
  // totalSeconds 를 인수로 받아서 시간 형식으로 formatting 하는 함수
  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    // 0:25:00.000000 을 온점을 기준으로 분리한 후, 첫번째 값만 가져옴(0:25:00)
    // 시간을 없애기 위해 인덱스를 이용하여 문자열을 추출(25:00)
    // print(duration.toString().split(".").first.substring(2, 7));
    return duration.toString().split(".").first;
  }

  // build() 는 Widget 을 반환
  @override
  Widget build(BuildContext context) {
    // Scaffold(): Material 디자인의 시각적 레이아웃 구조 구현
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Column(
        children: [
          Flexible(
            flex: 1,
            child: Container(
              alignment: Alignment.bottomCenter,
              child: Text(
                format(totalSeconds),
                style: TextStyle(
                  color: Theme.of(context).cardColor,
                  fontSize: 89,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ),
          Flexible(
            flex: 3,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  IconButton(
                    color: Theme.of(context).cardColor,
                    iconSize: 120,
                    onPressed: isRunning ? onPausePressed : onStartPressed,
                    icon: Icon(isRunning
                        ? Icons.pause_circle_outline
                        : Icons.play_circle_outline),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                          onPressed: () async {
                            duration = await showDurationPicker(
                              context: context,
                              initialTime:
                                  duration ?? const Duration(minutes: 25),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                            );
                            setState(() {
                              totalSeconds = duration!.inSeconds.toInt();
                            });
                          },
                          style: ButtonStyle(
                            textStyle:
                                MaterialStateProperty.all(const TextStyle(
                              fontSize: 14,
                            )),
                            backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).cardColor),
                          ),
                          color: Theme.of(context).cardColor,
                          iconSize: 40,
                          icon: const Icon(Icons.access_time_filled_outlined)),
                      const SizedBox(
                        width: 50,
                      ),
                      IconButton(
                          color: Theme.of(context).cardColor,
                          onPressed: onRestartPressed,
                          iconSize: 50,
                          icon: const Icon(Icons.restart_alt_outlined)),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                // cf) Expanded: 현재 축 기준으로 100% 확장
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(50),
                            topRight: Radius.circular(50))),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Pomodoros",
                          style: TextStyle(
                              fontSize: 20,
                              // cf) !. : 변수가 null 이 절대 아님을 표시
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                        Text(
                          "$totalCount",
                          style: TextStyle(
                              fontSize: 58,
                              fontWeight: FontWeight.w600,
                              color: Theme.of(context)
                                  .textTheme
                                  .displayLarge!
                                  .color),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
