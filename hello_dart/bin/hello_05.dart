void main(List<String> args) {
  var num1 = 100;
  var num2 = 200;
  // String Interpolation
  // 문자열 내부에 변수와 연산식 포함하기
  var message = "덧셈 : $num1 + $num2 = ${num1 + num2}";
  print(message);

  const age = 10;
  print("너의 나이는 ${age * 3} 이야");
}
