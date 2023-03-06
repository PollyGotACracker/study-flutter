import 'package:flutter/material.dart';

class ItemListView extends StatefulWidget {
  const ItemListView({super.key});

  @override
  State<ItemListView> createState() => _ItemListViewState();
}

class _ItemListViewState extends State<ItemListView> {
  /*
   * List.generate(길이, cb)
   * 길이 수 만큼 cb 함수를 실행하고 return 되는 결과를
   * List 로 만들어주는 함수
   */
  final itemList = List.generate(1000, (index) => "Item $index");
  List viewList = [];

  // State 클래스 내의 초기화 함수
  // 여러가지 변수 등을 초기화하는 코드를 포함할 수 있다.
  @override
  void initState() {
    // itemList 를 viewList 에 복제
    viewList.addAll(itemList);
    super.initState();
  }

  void _setFilterList(String search) {
    viewList.clear();
    if (search.isEmpty) {
      viewList.addAll(itemList);
    } else {
      // 입력값에 따른 데이터 filtering
      for (String item in itemList) {
        if (item.contains(search)) {
          viewList.add(item);
        }
      }
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("List View")),
      body: Column(
        children: [
          _searchInputBox(),
          _listViewBody(),
        ],
      ),
    );
  }

/*
 * flutter 모듈 분리: method 로 분리하기
 * 현재 아래의 모듈 함수에서 viewList state 배열을 공유하고 있다.
 * 이럴 때는 모듈을 Widget 으로 분리하는 것 보다는 method 로 분리하는 것이 좋다.
 * 또한 함수는 외부로부터 은닉하기 위하여 UnderBar(_) 로 함수 이름을 시작한다.
 * _searchInputBox(), _searchInputField()
 * _listViewBody(), _listViewCard()
 */

  Padding _searchInputBox() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: _searchInputField(),
    );
  }

  TextField _searchInputField() {
    return TextField(
      onChanged: (value) {
        _setFilterList(value);
      },
      decoration: const InputDecoration(
          labelText: "검색",
          hintText: "검색",
          prefixIcon: Icon(Icons.search_outlined),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(25.0)),
          )),
    );
  }

  Expanded _listViewBody() {
    return Expanded(
      child: ListView.builder(
          itemCount: viewList.length,
          // viewList 화면에 표시
          itemBuilder: (context, index) {
            return _listViewCard(index);
          }),
    );
  }

  Card _listViewCard(int index) {
    return Card(
        elevation: 3,
        child: ListTile(
          leading: const Icon(Icons.search),
          trailing: const Icon(Icons.more_vert_outlined),
          title: Text(
            viewList[index],
            style: const TextStyle(fontSize: 20),
          ),
          subtitle: Text("$index 번째 Item"),
        ));
  }
}
