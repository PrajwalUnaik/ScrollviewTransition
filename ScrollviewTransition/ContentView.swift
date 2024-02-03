//
//  ContentView.swift
//  ScrollviewTransition
//
//  Created by Prajwal U on 03/02/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack(spacing: 0) {
                ForEach(0 ..< 20) { _ in
                    Color.blue
                        .cornerRadius(40)
                        .padding()
                        .frame(height: UIScreen.main.bounds.height)

                        // MARK: - add this to see animation on scroll view

                        // start (tik-tok transition)

                        .scrollTransition(.interactive, axis:
                            .vertical) { view, phase in
                                view.opacity(phase.value < 0 ? 0 : 1.0)
                                    .offset(x: phase.value
                                        < 0 ? 500 : 0)
                                    .blur(radius: phase.value < 0 ? 15 : 0)
                                    .rotationEffect(.degrees(phase.value < 0 ? -90 : 0))
                        }

                    // end
                }
            }.scrollTargetLayout()
        }.scrollTargetBehavior(.paging)
            .ignoresSafeArea()
    }
}

#Preview {
    ContentView()
}
