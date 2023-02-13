void main(List<String> args) {
  /**
   * data Set
   * 중복을 허용하지 않는 list
   */
  var numberSet = {1, 2, 3, 4, 5, 6, 6, 6, 6, 6, 6, 6};
  print(numberSet); // {1, 2, 3, 4, 5, 6}

  Set<num> numSet = {1, 2, 3, 4, 5, 6, 7, 7, 7, 7, 7.9};
  print(numSet); // {1, 2, 3, 4, 5, 6, 7, 7.9}

  var nations = {"우리나라", "대한민국", "Korea", "KOREA", "Korea"};
  print(nations); // {우리나라, 대한민국, Korea, KOREA}
  nations.add("대한민국");
  print(nations); // {우리나라, 대한민국, Korea, KOREA}
}
