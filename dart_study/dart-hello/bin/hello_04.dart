void main(List<String> args) {
  // 배열 마지막 값에 , 를 붙이면 List 가 세로로 펼쳐짐
  var nums = [1, 2, 3, 4, 5, 6];
  List<int> nums2 = [1, 2, 3, 4, 5, 6];

  print("$nums, $nums2");

  // List 에 20 을 추가
  nums.add(20);
  print(nums);

  // List 중에서 3 의 값이 있으면 제거
  nums.remove(3);

  // index 의 값이 3 인 요소 제거
  nums.removeAt(3);

  // 첫 번째, 마지막 요소의 값 출력
  print(nums.first);
  print(nums.last);

  // 요소 순서 반전하여 나열
  print(nums.reversed);
  // nums 배열의 요소 순서를 섞음
  nums.shuffle();
  print(nums);

  var strs = ["가", "나", "다", "라"];
  print(strs);
  // strs 의 배열 개수가 3 이상일 경우 strs1 에 "완성" 문자열을 요소로 추가
  List<String> strs1 = [
    "가",
    "나",
    "다",
    if (strs.length >= 3) "완성",
  ];
}
