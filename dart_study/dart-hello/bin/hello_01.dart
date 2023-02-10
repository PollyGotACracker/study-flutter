// run : shift + ctrl + f5

void main(List<String> args) {
  print("반갑습니다");
  int num1 = 10;
  int num2 = 20;
  int sum = num1 + num2;
  print("$num1 + $num2 = $sum");

// 코드에서 직접 값을 대입하지 않으면 컴파일 오류가 난다.
// 컴파일 시점의 상수
  const name = "홍길동";
  const nation = "대한민국";
  print("$name 은 $nation 사람 입니다.");

  var num3 = 3.0;
  var num4 = 4.0;
  print("$num3 x $num4 = ${num3 * num4}");

/**
 * 변수에 null 을 저장하는 것에 대한 철저한 원칙이 있다.
 * 일반적인 변수에는 null 을 저장할 수 없다(non-nullable).
 * 단 특별히 ? 사용하여 null 을 지정할 수도 있다.
 */
  int? num5;
  print("$num5");
}
