import 'package:flutter/material.dart';

import 'screen/home.dart';
import 'screen/image.dart';
import 'screen/write.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Hello Flutter",
      theme: ThemeData(primarySwatch: Colors.green),
      initialRoute: "/",
      routes: {
        "/": (context) => const NavPage(body: Home()),
        "/image": (context) => const NavPage(body: ImagePage()),
        "/write": (context) => const NavPage(body: WritePage()),
      },
    );
  }
}

class NavPage extends StatelessWidget {
  const NavPage({super.key, required this.body});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Flutter Drawer"),
          centerTitle: true,
          elevation: 3,
        ),
        body: body,
        drawer: Drawer(
          child: ListView(
            children: [
              drawerMenuItem(
                title: "Home",
                icon: Icons.home,
                // Navigator 는 stack 구조(뒤로 가기: pop, 후입선출)
                // route => false : 이전페이지 모두 삭제
                // 특정 페이지에서 홈으로 간 후,
                // 홈에서 뒤로가기 시 어플 종료 또는 이전페이지로
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/", (route) => false),
              ),
              drawerMenuItem(
                title: "Image",
                icon: Icons.image,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/image", (route) => false),
              ),
              drawerMenuItem(
                title: "Write",
                icon: Icons.border_color,
                onTap: () => Navigator.pushNamedAndRemoveUntil(
                    context, "/write", (route) => false),
              ),
            ],
          ),
        ));
  }

  Card drawerMenuItem({
    String title = "Home",
    IconData icon = Icons.home,
    Function()? onTap,
  }) {
    return Card(
      elevation: 3,
      child: ListTile(
        leading: Icon(icon, color: Colors.grey[860]),
        title: Text(title),
        onTap: onTap,
      ),
    );
  }
}
