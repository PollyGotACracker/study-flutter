import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  // Container 는 SizedBox 보다 적용 가능한 속성 수가 많음
  @override
  Widget build(BuildContext context) {
    // Scaffold(): 화면을 그리는 method
    return Scaffold(
      appBar: AppBar(title: const Text("Hello Flutter")),
      body: bodyContainer(),
    );
  }

  Container bodyContainer() {
    return Container(
      width: 400,
      margin: const EdgeInsets.symmetric(horizontal: 5),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(border: Border.all(color: Colors.blue)),
      child: Column(
        children: [
          bodyText(
            text: "안녕하세요",
            fontSize: 30,
            fontColor: Colors.blue,
          ),
          bodyText(
            text: "Republic of Korea",
            fontColor: Colors.green,
            fontSize: 50,
          ),
          bodyText(text: "Korea"),
        ],
      ),
    );
  }

  // 중괄호로 묶여있는 파라미터에 인수를 전달할 때는
  // 파라미터 key 와 함께 전달해야 한다.
  Column bodyText(
      {required String text,
      Color fontColor = Colors.black,
      double fontSize = 10}) {
    return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(text, style: TextStyle(color: fontColor, fontSize: fontSize)),
        ]);
  }
}
