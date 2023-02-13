String sayHello(String name) {
  return "$name 님 안녕~";
}

void main(List<String> args) {
  String message = sayHello("홍길동");
  print(message);
}
