void main(List<String> args) {
  var oldContact = ["홍길동", "이몽룡", "성춘향"];
  // emoji : window + .
  var likeContact = [
    "임꺽정",
    "장보고",
    for (var fr in oldContact) "❤️ $fr",
  ];
  print(likeContact); // [임꺽정, 장보고, ❤️ 홍길동, ❤️ 이몽룡, ❤️ 성춘향]
}
