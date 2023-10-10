//
//  ContentView.swift
//  swiftui-task4
//
//  Created by MacBook on 09.10.2023.
//

import SwiftUI

struct ButtonViewModel: Identifiable {

    let id = UUID()
    let styleConfig: ScaleButtonStyle.Config
}

struct ContentView: View {

    @State private var buttons: [ButtonViewModel] = [
        .init(styleConfig: .init(scale: 0.86, duration: 0.22)),
        .init(styleConfig: .init(scale: 0, duration: 0.5))
    ]

    var body: some View {
        HStack(spacing: 40) {
            ForEach(buttons) { button in
                VStack {
                    AwesomeButton(styleConfig: button.styleConfig)
                        .padding(.bottom, 20)
                    Text("duration: \(String(format: "%.1f", button.styleConfig.duration))")
                    Text("scale: \(String(format: "%.1f", button.styleConfig.scale))")
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {

    static var previews: some View {
        ContentView()
    }
}
