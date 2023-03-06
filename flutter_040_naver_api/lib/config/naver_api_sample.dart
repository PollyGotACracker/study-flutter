import 'dart:convert';

import 'package:flutter/material.dart';
import '../models/naver_movie.dart';

// package:http/http.dart 객체를 http 라는 이름으로 사용
import 'package:http/http.dart' as http;

class NaverApi extends ChangeNotifier {
  String naverClientId = "";
  String naverClientSecret = "";

  Future<List<Movie>?> loadMovie([String? search]) async {
    String query = search ??= "공공의 적";
    Map<String, String> headers = {
      "X-Naver-Client-Id": naverClientId,
      "X-Naver-Client-Secret": naverClientSecret
    };
    String jsonURL =
        "https://openapi.naver.com/v1/search/movie.json?query=$query";

    /**
     * dynamic: 모든 데이터 type 을 수용할 수 있는 변수 선언
     */
    dynamic response;
    try {
      response = await http.get(
        Uri.parse(jsonURL),
        headers: headers,
      );
    } catch (e) {
      print(e);
    }
    print("Naver Response ${response.statusCode}");
    if (response.statusCode == 200) {
      Iterable resultItems = await json.decode(response.body)['items'];
      print("Naver 응답: $resultItems");

      // Movie 객체에 mapping 하기
      // Future<List<Movie>> type 으로 변환하여 return
      return resultItems.map((model) => Movie.fromJson(model)).toList();
    } else {
      print("Naver 연결 문제 발생");
      throw Exception("API 연결문제 발생 ${response.statusCode}");
    }
  }
}
