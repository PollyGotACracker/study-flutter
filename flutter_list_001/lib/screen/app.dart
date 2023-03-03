import 'package:flutter/material.dart';

import 'list_view.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter Demo",
      theme: ThemeData(
        primarySwatch: Colors.blue,
        // 아래 코드가 있을 경우 material theme 가 적용되지 않음
        // useMaterial3: true,
      ),
      // import 시 경로... package 가 있는 경로는 구버전 호환
      home: const ItemListView(),
    );
  }
}
