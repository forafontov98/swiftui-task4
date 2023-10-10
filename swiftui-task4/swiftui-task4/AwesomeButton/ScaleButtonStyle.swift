//
//  ScaleButtonStyle.swift
//  swiftui-task4
//
//  Created by MacBook on 10.10.2023.
//

import SwiftUI

struct ScaleButtonStyle: ButtonStyle {

    struct Config {
        let scale: CGFloat
        let duration: Double
    }

    let isAnimating: Bool
    let config: Config

    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .background(
                Circle()
                    .scaleEffect(3)
                    .foregroundColor(.gray.opacity(isAnimating ? 0.2 : 0))
            )
            .scaleEffect(isAnimating ? config.scale : 1)
            .animation(.linear(duration: config.duration), value: isAnimating)
    }
}
