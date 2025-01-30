//
//  ContentView.swift
//  TrafficLight
//
//  Created by Yaroslav Malygin on 27.01.2025.
//

import SwiftUI

struct ContentView: View {
    
    @State private var currentLight: CurrentLight? = nil
    @State private var buttonTitle = "START"
    
    private let lightIsOn = 1.0
    private let lightIsOff = 0.3
    
    var body: some View {
        VStack {
            VStack(spacing: 20) {
                LightView(
                    color: .red,
                    opacity: currentLight == .red ? lightIsOn : lightIsOff
                )
                LightView(
                    color: .yellow,
                    opacity: currentLight == .yellow ? lightIsOn : lightIsOff
                )
                LightView(
                    color: .green,
                    opacity: currentLight == .green ? lightIsOn : lightIsOff
                )
            }
            
            Spacer()
            
            Button(action: buttonAction) {
                Text(buttonTitle)
                    .font(.largeTitle)
                    .bold()
                    .foregroundStyle(.white)
                    .frame(width: 150)
            }
            .buttonStyle(.borderedProminent)
            .overlay(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 4)
            )
            .shadow(radius: 5)
            .padding(.bottom, 50)
        }
        .padding()
    }
    
    private func buttonAction() {
        if currentLight == nil {
            currentLight = .red
            buttonTitle = "NEXT"
        } else {
            switch currentLight {
            case .red:
                currentLight = .yellow
            case .yellow:
                currentLight = .green
            case .green:
                currentLight = .red
            case .none:
                break
            }
        }

    }
}

extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

#Preview {
    ContentView()
}
