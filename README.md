# gymnote

A new Flutter application.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## データの取扱

アプリケーション内で記録されたデータはAndroidスマホのローカルストレージに保存する。
保存するデータは以下のような`json`形式
```json
{
    "gym_visit": [
        {
            "datetime": "2021-01-01T18:25:43.511Z",
            "location_id": "8cb33614-fbe3-4590-9042-09f238874ff6",
        }
    ]
}
```

## 詰まったところ

- location.getLocationで位置情報の更新がされない。エミュレータでは位置情報の値を更新しているが、getLocationから返却される値は元のまま

## 参考URL

- [Flutterで始めるアプリ開発](https://www.flutter-study.dev/widgets/about-widget)
- [Flutter環境構築 Mac M1 (Apple Silicon) 版](https://zenn.dev/hndr/articles/14689ec937af1f)