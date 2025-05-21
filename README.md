# GeoHashKit

Swift用の簡単なGeoHash生成ライブラリです。

## インストール
Swift Package Managerを利用して追加してください。

```swift
.package(url: "<リポジトリURL>", from: "1.0.0"),
```

またはXcodeの"Add Package"からURLを指定して導入します。

## 使い方
```swift
import GeoHashKit

let code = GeoHash.create(lat: 35.0, lon: 135.0, digitCount: 8)
print(code) // geohash文字列
```

## ライセンス
このリポジトリはMITライセンスで公開されています。
