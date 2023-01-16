# flutter_knotted_tdd

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Environments

```
// settings.json
{
  // g, freezed 파일 중첩 활성화
  "explorer.fileNesting.patterns": {
    "*.dart": "${capture}.g.dart, ${capture}.freezed.dart"
  },
  "explorer.fileNesting.enabled": true,
  "explorer.fileNesting.expand": false,
  // 스크롤시 상단이 고정됨
  "editor.stickyScroll.enabled": true,
  // 위젯간의 Tree 라인 생성됨
  "dart.previewFlutterUiGuides": true,
  // 괄호들에 각각의 컬러가 생성되어 구분하기 좋아짐
  "editor.bracketPairColorization.enabled": true,
  // 저장시 포매팅
  "editor.formatOnSave": true,
  // 저장시 모든 에러 수정
  "editor.codeActionsOnSave": {
    "source.fixAll": true
  }
}

//launch.json
{
  // Use IntelliSense to learn about possible attributes.
  // Hover to view descriptions of existing attributes.
  // For more information, visit: https://go.microsoft.com/fwlink/?linkid=830387
  "version": "0.2.0",
  "configurations": [
    {
      "name": "flutter_knotted_tdd",
      "request": "launch",
      "type": "dart",
      "args": [
        "--dart-define",
        "base_url=https://v1.nocodeapi.com/sumkim/google_sheets",
        "--web-renderer",
        "html",
        "--web-hostname",
        "localhost",
        "--web-port",
        "7357"
      ]
    },

    {
      "name": "flutter_knotted_tdd (profile mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "profile"
    },
    {
      "name": "flutter_knotted_tdd (release mode)",
      "request": "launch",
      "type": "dart",
      "flutterMode": "release"
    }
  ]
}


```
