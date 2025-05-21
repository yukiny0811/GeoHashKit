// The Swift Programming Language
// https://docs.swift.org/swift-book

public enum Precision: Int {
    /// roughly 2500km
    case km2500 = 1
    /// roughly 630km
    case km630
    /// roughly 78km
    case km78
    /// roughly 20km
    case km20
    /// roughly 2.4km
    case km2_4
    /// roughly 610m
    case m610
    /// roughly 76m
    case m76
    /// roughly 19m
    case m19
    /// roughly 2.4m
    case m2_4
    /// roughly 0.6m
    case m0_6
    /// roughly 7.4cm
    case cm7_4
    /// roughly 1.9cm
    case cm1_9
    /// roughly 0.24cm
    case mm0_24
    /// roughly 0.06cm
    case mm0_06
    /// roughly 0.0074cm
    case mm0_0074
    /// roughly 0.0019cm
    case mm0_0019
}

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

    public static func create(lat: Double, lon: Double, precision: Precision) -> String {
        return create(lat: lat, lon: lon, digitCount: precision.rawValue)
    }
}
