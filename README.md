# GeoHashKit

Swift用の簡単なGeoHash生成ライブラリです。

## 使い方
```swift
import GeoHashKit

let code = GeoHash.create(lat: 35.0, lon: 135.0, digitCount: 8)
print(code) // geohash文字列
```
