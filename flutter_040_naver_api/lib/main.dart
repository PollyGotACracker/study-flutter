import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_naver/config/naver_api.dart';
import 'package:url_launcher/url_launcher.dart';

import 'models/naver_movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Naver 영화',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /*
   * resultMovie 는 변수 선언이지만
   * 실제적으로 함수로서의 역할을 수행한다. 
   * 
   * FutureBuilder 의 future 속성에 변수를 설정하고
   * future: resultMovie
   * FutureBuilder 가 화면에 rendering 을 하기 전에
   * resultMovie 변수를 참조(이때는 함수처럼 작동한다)
   * 
   * 변수를 참조하지만 NaverApi().loadMovie() 함수를 실행하는 것과 같다.
   */
  Future<List<Movie>?> resultMovie = NaverApi().loadMovie();
  // input box 를 핸들링하기 위한 ref id 를 선언하기
  // final TextEditingController searchController = new TextEditingController();
  final TextEditingController searchController = TextEditingController();

  // input 의 값이 자동으로 search 의 인수로 전달(e.target.value 와 유사)
  void searchHandler(search) {
    // String str = searchController.value.toString();  ==> 옛날 코드
    Future<List<Movie>?> searchMovie = NaverApi().loadMovie(search);
    resultMovie = searchMovie;
    setState(() {});
  }

  // 생명주기 함수: state 객체가 실행될 때 단 한번 실행되는 함수
  @override
  void initState() {
    super.initState();
  }

  // 생명주기 함수: 가장 마지막에 실행하는 함수
  // Widget 이 사라질 때. 메모리 누수 방지
  @override
  void dispose() {
    super.dispose();
    searchController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("MyHome");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: searchInputBox(),
      ),
      /**
       * FutureBuilder 의 작동 원리
       * 1. future 속성에 설정된 함수(변수)를 실행하여 데이터를 가져온다.
       * 2. 가져온 데이터는 builder 속성의 
       *    callback 함수에 snapshot 매개변수로 전달한다.
       * 3. ListView.builder 에게 데이터를 전달한다.
       * 4. ListView.builder 는 snapshot.data 에 담긴 데이터(보통 list)를
       *    화면에 rendering 한다.
       * 5. ListView.builder 는 itemBuilder 속성에 설정된 callback 함수를
       *    사용하여 각각 개별적인 데이터를 화면에 rendering 한다.
       * 6. ListView.builder 는 2개의 속성을 갖는다.
       *      itemCount: 몇 개의 데이터를 rendering 할 것인가
       *        FutureBuilder 에게서 몇 개의 데이터가 있는지 통보받고
       *        실제 화면에 그릴 수 있는 데이터가 몇 개인가를 분석하여
       *        다시 futureBuilder 에게 통보하여 데이터를 그릴 수 있는 개수만큼만
       *        가져오도록 알려준다.
       *      itemBuilder: 각각 개별적인 데이터를 rendering 하는 코드가 작성된다.
       */
      body: FutureBuilder(
        future: resultMovie,
        builder: (context, snapshot) {
          return ListView.builder(
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              Movie movie = snapshot.data![index];

              return movieItemView(movie);
            },
          );
        },
      ),
    );
  }

  Padding movieItemView(Movie movie) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: Card(
        elevation: 3,
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        child: InkWell(
          borderRadius: BorderRadius.circular(10),
          highlightColor: Colors.redAccent.withOpacity(0.6),
          splashColor: Colors.cyanAccent.withOpacity(0.5),
          onLongPress: () {
            launchUrl(Uri.parse(movie.link));
          },
          child: ListTile(
            // network: image url 방식으로 가져옴
            leading: movie.image.isNotEmpty
                ? Image.network(movie.image)
                : Image.asset("images/no_image.png"),
            title: Html(data: movie.title, style: {
              "*": Style(
                fontSize: const FontSize(15),
                textOverflow: TextOverflow.ellipsis,
              ),
              "b": Style(
                fontWeight: FontWeight.w600,
                color: Colors.blue,
              ),
            }),
            subtitle: Text(movie.subtitle),
          ),
        ),
      ),
    );
  }

  TextFormField searchInputBox() {
    return TextFormField(
      // TextFormField 를 핸들링하기 위한 ref id 설정
      controller: searchController,
      // onFieldSubmitted: searchHandler,
      onChanged: searchHandler,
      style: const TextStyle(color: Colors.white, fontSize: 22),
      decoration: InputDecoration(
          enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.grey)),
          focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.white)),
          filled: true,
          prefixIcon:
              const Icon(Icons.movie_edit, color: Colors.white, size: 30),
          suffixIcon: IconButton(
              onPressed: () {
                searchController.clear();
              },
              icon: Icon(Icons.clear, color: Colors.amber.shade100, size: 25)),
          hintText: "영화명 검색",
          hintStyle: const TextStyle(color: Colors.grey)),
    );
  }
}
