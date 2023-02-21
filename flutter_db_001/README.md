# flutter_db_001

- flutter 를 사용한 DB 핸들링
- Android 나 iOS 에서는 SQLite DBMS 가 내장되어있다.
- 매우 작은 파일 구조, Map(Key, Value) 형태의 Data 관리 도구

## SQLite 를 사용하기 위한 Dependency 를 설정하기

- 프로젝트의 최상위 폴더 터미널에서 실행

```
flutter pub add sqflite
flutter pub add path
```

- pubspec.yaml 에서 `sqflite: ...`, `path: ...` 확인

## DB 연동을 위한 Data Class 를 생성하기
