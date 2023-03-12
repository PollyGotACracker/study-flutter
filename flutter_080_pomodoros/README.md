# flutter_080_pomodoros

## Timer.periodic

```dart
Timer.periodic(
    Duration duration,
    void callback(
        Timer timer
    )
)
```

- callback 은 취소될 때까지 지정된 간격으로 호출됨

## Duration

```dart
const duration = Duration(hours: 2, minutes: 3, seconds: 2);
print(duration.inDays); // 0
print(duration.inHours); // 2
print(duration.inMinutes); // 123
print(duration.inSeconds); // 7382
print(duration.inMilliseconds); // 7382000
```

- 한 시점에서 다른 시점까지의 차이를 나타냄
