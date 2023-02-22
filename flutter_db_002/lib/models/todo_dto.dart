class TodoDto {
  final int id;
  final String content;
  final String sdate;
  final String edate;
  final String stime;
  final String etime;

// TodoDto 의 생성자 method
  const TodoDto({
    this.id = 0,
    required this.content,
    required this.sdate,
    required this.stime,
    this.edate = "",
    this.etime = "",
  });

// Dto 객체에 담긴 데이터를 insert 할 때 Map 으로 변환시키기 위한 함수
  Map<String, dynamic> toMap() {
    return {
      // 최신 dart 에서는 key 를 문자열로 하지 않아도
      // JSON type 으로 변경 가능
      content: content,
      sdate: sdate,
      stime: stime,
    };
  }
}
