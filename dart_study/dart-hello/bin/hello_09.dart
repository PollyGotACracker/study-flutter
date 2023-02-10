import '../lib/sub_modules.dart' as sub;

void main(List<String> args) {
  // 위치 기반 파라미터 함수 호출
  print(sub.sayHelloParams("홍길동", 33));
  // named 기반 파라미터 함수 호출
  print(sub.sayHelloNamesParams(age: 20, name: "이몽룡"));
  // 선택적 파라미터 함수 호출
  print(sub.sayHelloNamesOptionalParams(name: "이몽룡"));
}
