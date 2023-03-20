# hello_003

## Flutter lifeCycle

#### `initState()`

- 위젯이 생성될 때 처음 호출, stateful 이 state 를 호출할 때
- `BuildContext` 에 의존적인 데이터 초기화
- 동일 위젯 트리 내에서 속성 초기화

#### `didChangedDependencies()`

- 위젯이 최초 생성될 때 initState() 다음에 호출
- 위젯이 의존하는 데이터의 객체가 호출될 때마다
- 위젯이 업데이트 될 때마다 네트워크 호출이 필요한 경우 등에서 사용

#### `build()`

- 매우 자주 호출
- 화면이 바뀔 때마다(state 가 변경될 때마다)
- `return Scaffold()` 등으로 Widget 을 return 해야 한다.

#### `setState()`

- 개발자가 호출하고 싶을 때
- state(변수) 에 변화를 주고 싶을 때
- state 에 따라 화면을 갱신하고 싶을 때

#### `dispose()`

- state 객체가 영구적으로 제거될 때
- 더이상 build 되지 않는 화면
- Navigator 등을 사용하여 다른 화면을 호출할 때 등
