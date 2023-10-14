//
//  ContentView.swift
//  LayoutAndGeometry
//
//  Created by Alex Bonder on 10/7/23.
//

import SwiftUI

struct ContentView: View {
//    let colors: [Color] = [.red, .green, .blue, .orange, .pink, .purple, .yellow]

    var body: some View {
        GeometryReader { fullView in
            ScrollView(.vertical) {
                ForEach(0..<50) { index in
                    GeometryReader { geo in
                        Text("Row #\(index)")
                            .font(.title)
                            .frame(maxWidth: .infinity)
//                            .background(colors[index % 7])
                            .background(Color(hue: min(geo.frame(in: .global).midY / fullView.size.height, 1.0), saturation: 1, brightness: 1))
                            .opacity(geo.frame(in: .global).midY / 200)
                            .rotation3DEffect(.degrees(geo.frame(in: .global).minY - fullView.size.height / 2) / 5, axis: (x: 0, y: 1, z: 0))
                            .scaleEffect(max(0.5, geo.frame(in: .global).midY / fullView.frame(in: .global).midY))
                            .onTapGesture {
                                print(geo.frame(in: .global).midY / fullView.size.height)
                            }
                    }
                    .frame(height: 40)
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
