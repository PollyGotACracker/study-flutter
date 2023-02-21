import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/dog_dto.dart';

class DogDBService {
  // late : 변수의 지연 생성 키워드
  // 변수를 즉시 초기화 하지 않고, 잠시 후에 초기화 하겠다
  late Database _database;

  List<Dog> dogs = [
    const Dog(name: "멍멍이", age: 12),
    const Dog(name: "왈왈이", age: 3),
    const Dog(name: "몽실이", age: 5),
    const Dog(name: "킁킁이", age: 1),
    const Dog(name: "복실이", age: 10),
  ];

// db 가 없을 경우 table 생성
  final String createTableSql = '''
      CREATE TABLE dogs (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        age INTEGER
      )
      ''';

  /*
   * Future 클래스
   * 현재는 데이터가 없지만, 미래에 데이터가 필요할 때 
   * 가져다달라는 용도로 사용하는 클래스 (필요할 때 fetch)
   */
  Future<Database> get database async {
    _database = await initDB();
    return _database;
  }

  Future<void> _onCreateTable(db, version) {
    return db.execute(createTableSql);
  }

  Future<void> _onUpgradeTable(db, oldVersion, newVersion) async {
    final batch = db.batch();
    batch.execute("DROP TABLE dogs");
    batch.execute(createTableSql);
    await batch.commit();
  }

  /*
   * DB 에 연결하기 위한 함수
   */
  Future<Database> initDB() async {
    // 디바이스마다 DB 가 저장된 위치가 다르므로
    // 각 디바이스의 DB 가 저장된 경로를 알려주는 함수
    String dbPath = await getDatabasesPath();
    // device/db/dog_database.db 라는 경로를 생성하는 함수(join)
    String dbFile = join(dbPath, "dog_database.db");
    return await openDatabase(
      dbFile,
      onCreate: _onCreateTable,
      onUpgrade: _onUpgradeTable,
      version: 4,
    );
  }

  Future<void> insert(Dog dog) async {
    // insert 하기 위한 database open (getter 함수 호출)
    final db = await database;

    // dog_dto.dart 의 toMap 함수
    await db.insert(
      "dogs",
      dog.toMap(),
      // key 값이 중복될 경우 덮어쓰기 하라
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dog>> selectAll() async {
    final db = await database;

    final List<Map<String, dynamic>> dogMaps = await db.query("dogs");
    return List.generate(dogMaps.length, (index) {
      return Dog(
          id: dogMaps[index]['id'],
          name: dogMaps[index]['name'],
          age: dogMaps[index]['age']);
    });
  }

  Future<int> delete(int id) async {
    final db = await database;

    return db.rawDelete("DELETE FROM dogs WHERE id = ?", [id]);
    // 아래와 같은 코드 절대 사용 금지. DB Injection 공격 노출
    //db.rawDelete("DELETE FROM dogs WHERE id = ${id}");
  }
}
