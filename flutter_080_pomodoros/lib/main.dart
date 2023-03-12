import 'package:flutter/material.dart';
import 'package:flutter_080_pomodoros/screens/home_screen.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
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
