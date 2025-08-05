# life_track

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

---

## format

```
dart format .
```

## DB

ローカルDBにdriftを採用してみた

コードを自動生成するためのコマンド
```
flutter pub run build_runner build --delete-conflicting-outputs
```

何度も変更する場合はこっちで変更の度に自動でbuildしてくれる
```
flutter pub run build_runner watch
```

## アプリ起動

```
flutter run

r // ホットリロード
R // ホットリスタート
```

## ローカルDBファイルをコピー

```
// Android
adb exec-out run-as com.example.life_track cat app_flutter/app.db > ~/Desktop/app_export.db

// iOS
find ~/Library/Developer/CoreSimulator -name app.db
cp <見つけたパス> ~/Desktop/app_export.db
```
