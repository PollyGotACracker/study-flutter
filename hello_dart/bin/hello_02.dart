String str = "Korea";
int num1 = 12;
bool bYes = true;
double num2 = 12.333;

void main(List<String> args) {
  /**
   * const 키워드는 반드시 값이 명확해야 한다.
   * final : 선언부와 초기화 값을 분리할 수 있다.
   */
  const name = "홍길동";
  final nation;
  nation = "대한민국";
  print("$name 은 $nation 사람");
}
