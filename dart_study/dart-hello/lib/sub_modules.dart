String sayHelloParams(String name, int age) {
  return "안녕하세요, $name. 당신의 나이는 $age 입니다.";
}

String sayHelloNamesParams({String? name, int? age}) =>
    "안녕하세요, $name. 당신의 나이는 $age 입니다.";

String sayHelloNamesOptionalParams({String? name = "무명", int? age = 0}) =>
    "안녕하세요, $name. 당신의 나이는 $age 입니다.";
