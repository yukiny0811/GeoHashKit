//
//  ContentView.swift
//  Demo
//
//  Created by Yuki Kuwashima on 2025/02/14.
//

import SwiftUI
import GeoHashKit

struct ContentView: View {
    @State var result = ""
    var body: some View {
        Text(result)
        Button("aaa") {
            result = GeoHash.create(lat: 135, lon: 35.001, digitCount: 10)
        }
    }

    
}

#Preview {
    ContentView()
}
