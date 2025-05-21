// The Swift Programming Language
// https://docs.swift.org/swift-book

public enum GeoHash {
    public static func create(lat: Double, lon: Double, digitCount: Int) -> String {
        let base32 = Array("0123456789bcdefghjkmnpqrstuvwxyz")
        var isEvenBit = true
        var bit = 0
        var ch = 0
        var geohash = ""
        var latRange = (-90.0, 90.0)
        var lonRange = (-180.0, 180.0)
        while geohash.count < digitCount {
            if isEvenBit {
                let mid = (lonRange.0 + lonRange.1) / 2
                if lon > mid {
                    ch = (ch << 1) | 1
                    lonRange.0 = mid
                } else {
                    ch = (ch << 1)
                    lonRange.1 = mid
                }
            } else {
                let mid = (latRange.0 + latRange.1) / 2
                if lat > mid {
                    ch = (ch << 1) | 1
                    latRange.0 = mid
                } else {
                    ch = (ch << 1)
                    latRange.1 = mid
                }
            }
            isEvenBit.toggle()
            bit += 1
            if bit == 5 {
                geohash.append(base32[ch])
                bit = 0
                ch = 0
            }
        }
        return geohash
    }
}
