//
//  LightView.swift
//  TrafficLight
//
//  Created by Yaroslav Malygin on 27.01.2025.
//

import SwiftUI

struct LightView: View {
    let color: Color
    let opacity: Double
    
    var body: some View {
        Circle()
            .foregroundStyle(color)
            .opacity(opacity)
            .frame(width: 130, height: 130)
            .overlay(Circle().stroke(Color.white, lineWidth: 7))
            .shadow(radius: 10)
    }
}

#Preview {
    LightView(color: .green, opacity: 0.3)
}
