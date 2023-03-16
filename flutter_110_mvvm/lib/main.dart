import 'package:flutter/material.dart';
import 'package:flutter_110_mvvm/ui_models/counter_view_model.dart';
import 'package:provider/provider.dart';

// ChangeNotifier 클래스를 mixin 한다.
// mixin 키워드는 dart 에서 with 를 사용한다.
// ChangeNotifier 클래스를 mixin 한 클래스는 viewModel 클래스가 된다.

void main() {
  runApp(
    // viewModel 클래스를 provider 로 등록하는 절차
    ChangeNotifierProvider(
      create: (_) => CounterViewModel(),
      child: const App(),
    ),
  );
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    // viewModel 가져오기
    // var viewModel = context.watch<CounterViewModel>();
    var increment =
        context.select<CounterViewModel, Function()>((v) => v.increment);

    return MaterialApp(
        home: Scaffold(
            appBar: AppBar(title: const Text("Hello")),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Hello"),
                  Text(
                    // viewModel.counter.toString(),
                    context
                        .select<CounterViewModel, int>((v) => v.counter)
                        .toString(),
                    style: const TextStyle(fontSize: 30),
                  ),
                  ElevatedButton(
                    // onPressed: viewModel.increment,
                    onPressed: increment,
                    child: const Text("증가"),
                  )
                ],
              ),
            )));
  }
}
