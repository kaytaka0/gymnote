# Gymnote

トレーニングでのフィットネスジム通いの頻度を可視化するスマートフォンアプリ

githubプロフィールで表示される日々のコントリビューション(草を生やすやつ)のグラフのように可視化することでモチベーションアップをねらう。

## TODO
- データ保存ロジック
- トレーニング記録の表示
- トレーニング記録のグラフ表示

## 保存データ形式

永続化させるデータの種類は、「フィットネスジムへの来訪記録」の一種類のみ。
### 来訪記録(gym_visit)フィールド
- location_id: フィットネスジム店舗のUUID
- datetime: 来訪時間

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

- エミュレータでのデバッグでlocation.getLocationで位置情報の更新がされない。デバッグ機能no
画面では位置情報の値を更新しているが、getLocationから返却される値は元のまま -> 値を変更後に「send」を押す比喩等がある
- 

## 参考URL

- [Flutterで始めるアプリ開発](https://www.flutter-study.dev/widgets/about-widget)
- [Flutter環境構築 Mac M1 (Apple Silicon) 版](https://zenn.dev/hndr/articles/14689ec937af1f)