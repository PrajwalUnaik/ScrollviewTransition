//
//  ContentView.swift
//  ScrollviewTransition
//
//  Created by Prajwal U on 03/02/24.
//

import SwiftUI

struct ContentView1: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                ForEach(0 ..< 20) { _ in
                    Color.mint
                        .frame(height: 200)
                        .cornerRadius(10)
                        .padding(.horizontal)

                        // MARK: - add this to see animation on scroll view

                        // start

                        .scrollTransition(.animated, axis:
                            .vertical) { view, phase in
                                view.opacity(phase.value < 0 ? 0.8 : 1.0)
                                    .offset(x: phase.value
                                        < 0 ? 500 : 0)
                                    .blur(radius: phase.value < 0 ? 15 : 0)
                                    .rotationEffect(.degrees(phase.value < 0 ? -90 : 0))
                                    .brightness(phase.value < 0 ? 0.8 : 0)
                        }
                    // end
                }
            }.scrollTargetLayout()
        }.scrollTargetBehavior(.paging)
    }
}

#Preview {
    ContentView1()
}
