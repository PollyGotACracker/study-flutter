import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Row 에 ctrl + . => Extract Widget
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        // Column 에 ctrl + . => Wrap with Row
        Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: const [
            Text("Hello Polly",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                )),
            Text("bitterns96@gmail.com",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                )),
          ],
        ),
      ],
    );
  }
}
