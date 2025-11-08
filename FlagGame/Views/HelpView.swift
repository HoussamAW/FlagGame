//
//  HelpView.swift
//  FlagGame
//
//  Created by Houssam on 28/10/2025.
//

import SwiftUI

struct HelpView: View {
    @State private var sheetHelp = false
    var body: some View {
        Button {
            sheetHelp.toggle()
            triggerHapticFeedback(style: .medium)
        } label: {
            Image(systemName: "questionmark")
                .foregroundColor(.red)
                .font(.title2)
                .bold()
        }.sheet(isPresented: $sheetHelp) {
            Help()
        }
    }
}

struct Help: View {
    var body: some View {
        VStack {
           Text("View is Coming")
        }
    }
}
#Preview {
    HelpView()
}
