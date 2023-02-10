void main(List<String> args) {
  // Map type 의 데이터. JSON 데이터와 매우 유사
  const obj = {
    "name": "홍길동",
    "age": 33,
    "tel": "010-111-1111",
  };
  print(obj);
  print(obj.keys);
  print(obj["name"]);
  print(obj.values);
  print(obj
      .entries); // (MapEntry(name: 홍길동), MapEntry(age: 33), MapEntry(tel: 010-111-1111))

  Map<int, String> std = {
    1: "홍길동",
    2: "이몽룡",
    3: "성춘향",
  };
  // key 값으로 찾기
  print(std[1]);
  print(std[2]);
  print(std[3]);
  std[3] = "남진";
  print(std); // {1: 홍길동, 2: 이몽룡, 3: 남진}

  const players = [
    {"이름": "홍길동", "나이": 33},
    {"이름": "이몽룡", "나이": 20},
    {"이름": "성춘향", "나이": 18},
  ];
  print(players);
}
