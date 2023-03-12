# Flutter

- flutter create project_name
- https://docs.flutter.dev/reference/widgets
- https://docs.flutter.dev/development/ui/widgets

## Marketplace

- `Dart`
- `Flutter`
- `Error Lens`

## Settings.json 설정

- ctrl + shift + p => Open User Settings(JSON)

```
{
  "[dart]": {
    "editor.formatOnSave": true,
    "editor.formatOnType": true,
    "editor.rulers": [80],
    "editor.selectionHighlight": false,
    "editor.suggest.snippetsPreventQuickSuggestions": false,
    "editor.suggestSelection": "first",
    "editor.tabCompletion": "onlySnippets",
    "editor.wordBasedSuggestions": false
  },
  "dart.previewFlutterUiGuides": true,
  "dart.showInspectorNotificationsForWidgetErrors": false,
  "editor.codeActionsOnSave": {
    "source.fixAll": true,
    "source.fixAll.eslint": true
  }
}
```

- cf) `"source.fixAll.eslint": true` : `ctrl + s`(저장) 로 문법 오류 수정

## Widget Inspector

- Run 으로 실행 후 나타나는 도구모음 박스에서 돋보기 버튼 클릭
- 만약 오류가 발생할 경우 vscode 캐시 삭제

```
C:\Users\사용자\AppData\Roaming\Code\Cache\Cache_Data
C:\Users\사용자\AppData\Roaming\Code\CachedData
C:\Users\사용자\AppData\Roaming\Code\logs
```
