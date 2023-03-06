import 'package:flutter/material.dart';

import '../models/dog_dto.dart';
import '../persistence/dog_db_service.dart';

class DogListView extends StatelessWidget {
  const DogListView({super.key, required this.snapshot});
  final AsyncSnapshot<List<Dog>> snapshot;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: snapshot.data?.length,
      itemBuilder: (BuildContext context, int index) {
        Dog dog = snapshot.data![index];
        // Dismissible : 좌우로 swipe 하면 데이터가 화면에서 사라짐
        return Dismissible(
            key: UniqueKey(),
            confirmDismiss: (direction) {
              // confirm 표시 함수
              return confirmDelete(context, dog);
            },
            // swipe 하여 데이터를 지우면 db delete 수행
            onDismissed: (direction) {
              DogDBService().delete(dog.id);
              // setState(() {});
            },
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    width: 100,
                    padding: const EdgeInsets.all(10),
                    child: Text(dog.name,
                        style:
                            const TextStyle(fontSize: 20, color: Colors.blue)),
                  ),
                  Container(
                    width: 50,
                    padding: const EdgeInsets.all(10),
                    child: Text("${dog.age}",
                        style: const TextStyle(fontSize: 16)),
                  ),
                ],
              ),
            ));
      },
    );
  }

// true 또는 false 반환
  Future<bool?> confirmDelete(BuildContext context, Dog dog) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)),
            title: Column(
              children: const [Text("데이터 삭제")],
            ),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [Text("${dog.name}:\n삭제된 데이터는 복구할 수 없습니다.")],
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.redAccent),
                  onPressed: () {
                    Navigator.pop(context, true);
                  },
                  child: const Text("삭제")),
              ElevatedButton(
                  // elevation: 그림자
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white, elevation: 7),
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child:
                      const Text("취소", style: TextStyle(color: Colors.black)))
            ]);
      },
    );
  }
}
