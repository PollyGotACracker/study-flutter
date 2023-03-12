import 'package:flutter/material.dart';
import 'package:flutter_080_pomodoros/screens/home_screen.dart';

void main() {
  // runApp(): Widget tree에서 최상단에 위치하는 Widget 을 파라미터로 받는 함수
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  // build(): Widget 객체를 return 하는 함수로 BuildContext 객체를 인수로 받음
  // context: Widget tree 에서 현재 Widget 의 위치에 관한 정보를 담고 있는 변수
  @override
  Widget build(BuildContext context) {
    // MaterialApp(): 모든 위젯을 감싸고 있는 android UI 위젯
    // title:, theme:, home:...
    return MaterialApp(
        // 사용자 정의 theme
        theme: ThemeData(
          colorScheme:
              ColorScheme.fromSwatch(backgroundColor: const Color(0xFF91CBFA)),
          textTheme: const TextTheme(
            displayLarge: TextStyle(
              color: Color(0xFF232B55),
            ),
          ),
          cardColor: const Color(0xFFF4EDDB),
        ),
        home: const HomeScreen());
  }
}
