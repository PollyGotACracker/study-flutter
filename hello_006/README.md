# hello_006

- 로컬디스크 `C:\Program Files\Java\jdk-15.0.2\bin` 이동
- git bash 또는 윈도우 cmd 창 열기
- `./keytool -genkey -keystore ~/key.jks -keyalg RSA -keysize 2048 -validity 10000 -alias key`
- `C:\Users\사용자이름` 경로로 이동하여 key.jks 파일 생성 확인

## 배포 준비

1. 프로젝트 ID 변경하기
   `flutter pub add change_app_package_name`

2. package 이름 변경하기
   `flutter pub run change_app_package_name:main com.polly.hello`

3. /android/app/src/AndroidManifest.xml 에서 확인

4. /pubspec.yaml 에서 확인

5. /android/key.properties 파일 생성

```
storePassword=비밀번호
keyPassword=비밀번호
keyAlias=key
storeFile=C:\Users\사용자이름/key.jks
```

6. build.gradle 파일에 코드 추가

- android {} 위에 다음 코드 추가

```
// def keystore
def keystoreProperties = new Properties()
def keystorePropertiesFile = rootProject.file('key.properties')
if (keystorePropertiesFile.exists()) {
   keystoreProperties.load(new FileInputStream(keystorePropertiesFile))
}
```

- buildTypes {} 위에 다음 코드 추가

```
   signingConfigs {
       release {
           keyAlias keystoreProperties['keyAlias']
           keyPassword keystoreProperties['keyPassword']
           storeFile keystoreProperties['storeFile'] ? file(keystoreProperties['storeFile']) : null
           storePassword keystoreProperties['storePassword']
       }
   }
```

7. 안드로이드 App build

- git bash 또는 윈도우 cmd 창 열기
  `flutter build api --split-per-abi`
