# flutter_060_firebase_db

## firebase DB 연동하기

1. `firebase.google.com` 에서 프로젝트 생성하고 지시하는 대로 따라하기
2. `google-service.json` 파일을 `Android/app` 폴더에 붙여넣기
3. `/android/build.gradle`, `/android/app/build.gradle` 파일 설정하기

### (프로젝트 수준) build.gradle(/android)

- buildscript 아래 dependencies 항목에 다음 코드 추가

```
classpath 'com.google.gms:google-services:4.3.15'
```

### (앱 수준) build.gradle(/android/app)

- plugins 항목에 다음 코드 추가

```
apply plugin: 'com.google.gms.google-services'
```

- dependencies 항목에 다음 코드 추가

```
implementation platform('com.google.firebase:firebase-bom:31.2.3')
implementation 'com.google.firebase:firebase-analytics-ktx'
```

## dependencies 설정

- `flutter pub add firebase_core` : firebase 모든 기능에 대한 필수 설정
- `flutter pub add firebase_database` : real-time database 를 사용하기 위한 설정
