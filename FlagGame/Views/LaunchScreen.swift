//
//  LaunchScreen.swift
//  FlagGame
//
//  Created by Houssam  on 29/12/2023.
//

import SwiftUI

struct LaunchScreen: View {
    @State private var isActive = false
    @State private var size = 0.2
    @State private var opacity = 3.5
    var body: some View {
        if isActive {
            MenuView()
        } else {
        ZStack {
            Color.green.opacity(0.4)
                .ignoresSafeArea()
            VStack {
                Image("monde")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }.scaleEffect(size)
                .opacity(opacity)
                .onAppear {
                    withAnimation(.easeIn(duration: 1.2)) {
                        self.size = 0.9
                        self.opacity = 1.0
                    }
                }
                .onAppear {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        self.isActive = true
                        
                    }
                }
            }
        }
    }
}

#Preview {
    LaunchScreen()
}
