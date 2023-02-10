// 매개변수로 전달받은 name 값이 null 이 아니면(?) 대문자로 바꾸어 return
// 만약 name 값이 null 이면(??) null 값을 return
String? namedArrow(String? name) => name?.toUpperCase() ?? null;

// 위의 코드와 동일한 결과
String? namedArrowFunc(String? name) {
  if (name != null) {
    return name.toUpperCase();
  } else {
    return null;
  }
}

// Null Safe. return 값이 null 을 허용하지 않는 함수
String safeArrow(String? name) =>
    name != null ? name.toUpperCase() : "NOT NULL";
