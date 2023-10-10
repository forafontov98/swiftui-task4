//
//  AwesomeButton.swift
//  swiftui-task4
//
//  Created by MacBook on 10.10.2023.
//

import SwiftUI

struct AwesomeButton: View {

    @State private var isAnimating = false
    @State private var isScaleAnimating = false

    private let triangleWidth: CGFloat = 30

    let styleConfig: ScaleButtonStyle.Config

    var body: some View {
        Button {
            guard !isAnimating else { return }

            withAnimation(
                .interpolatingSpring(stiffness: 170, damping: 15)
            ) {
                isAnimating = true
                isScaleAnimating = true
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + 0.6) {
                self.isAnimating = false
            }

            DispatchQueue.main.asyncAfter(deadline: .now() + styleConfig.duration) {
                self.isScaleAnimating = false
            }
        } label: {
            Group {
                HStack(spacing: 0) {
                    rightArrow
                        .frame(width: 0, height: 0)
                        .scaleEffect(isAnimating ? .init(width: 1, height: 1) : .zero)
                        .offset(x: isAnimating ? triangleWidth / 2 : 0, y: 0)
                        .opacity(isAnimating ? 1 : 0)
                    rightArrow
                        .offset(x: isAnimating ? triangleWidth : 0, y: 0)
                        .opacity(1)
                    rightArrow
                        .scaleEffect(isAnimating ? .zero : .init(width: 1, height: 1))
                        .offset(x: isAnimating ? 0.4 * triangleWidth : 0, y: 0)
                        .opacity(isAnimating ? 0 : 1)
                }
            }
        }
        .buttonStyle(ScaleButtonStyle(isAnimating: isScaleAnimating, config: styleConfig))
    }

    private var rightArrow: some View {
        Image(systemName: "arrowtriangle.right.fill")
            .resizable()
            .renderingMode(.original)
            .frame(
                width: triangleWidth,
                height: triangleWidth,
                alignment: .center
            )
            .foregroundColor(.blue)
    }
}
