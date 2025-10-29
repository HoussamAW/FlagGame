//
//  ContentView.swift
//  FlagGame
//
//  Created by Houssam  on 25/12/2023.
//

import SwiftUI
import UIKit
import AVFoundation

struct ContentView: View {
    @Environment(\.colorScheme) var colorScheme
    @Environment(\.dismiss) var dismiss
    @State var answer = ""
    @State var progress = 0.01
    @State var img = ["USA","France","UK","Germany","ADS","Greece","Comores","Italia","Israel","Nigeria","Arabia"]
    @State var currentImage = ""
    @State var audioPlayer: AVAudioPlayer?
    var body: some View {
        VStack {
            HStack(spacing: 20) {
                Button {
                        dismiss()
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.gray.opacity(0.4))
                        .bold()
                        .font(.title)
                }
                .offset(y:18)
                
                ProgressView("", value: progress, total: 1.0)
                    .progressViewStyle(LinearProgressViewStyle(tint: .green))
                    .frame(width:300)
                    .clipShape(RoundedRectangle(cornerRadius: 2))
                    .scaleEffect(x: 1, y: 4, anchor: .center)
                    .offset(y:-18)
                   
            }
            Spacer()
        if progress <= 1.0 {
            ZStack {
                Rectangle()
                    .frame(width: 350,height: 300)
                    .foregroundColor(colorScheme == .light ? .white: .black)
                    .cornerRadius(20)
                    .shadow(radius: 3)
                   
                Image(currentImage)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .cornerRadius(10)
                    .shadow(color: colorScheme == .dark ? .white: .black, radius: 3)
                    .padding()
            }.padding()
            TextField("Enter the answer", text: $answer, onEditingChanged: { isEditing in
                if isEditing {
                    self.triggerHapticFeedback(style: .heavy)
                }
            })
            .onChange(of: answer) {
                triggerHapticFeedback(style: .medium)
            }
                .textFieldStyle(.plain)
                .bold()
                .multilineTextAlignment(.center)
            
            Divider()
                .frame(height: 2)
                .overlay(.cyan.opacity(0.2))
                .padding()
            
            
                Button("Check") {
                    Check()
                }.foregroundColor(.cyan)
                    .bold()
                    .tint(.green.opacity(0.2))
                    .font(.title3)
                    .padding()
                    .onAppear(perform: showRandomImage)
            } else {
                ZStack {
                    Rectangle()
                        .frame(width: 350,height: 300)
                        .foregroundColor(colorScheme == .light ? .white: .black)
                        .cornerRadius(20)
                        .shadow(radius: 3)
                    Text("Congralution !!! you know Europe now !!!")
                }.padding()
                    Button("Restart") {
                      restart()
                    }.foregroundColor(.green)
                        .bold()
                        .tint(.green.opacity(0.5))
                        .buttonStyle(.bordered)
                        .font(.title3)
                }
            Spacer()
        }
        .padding()
    }
    
    func Check() {
     switch answer {
        case "Etats-unis" : progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "France" : progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Royaume-unis": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Allemagne": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Afrique du sud" : progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Grece" : progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Comores": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Italie": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Israel": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Nigeria": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        case "Arabie saoudite": progress += 0.1
            answer = ""
         PlaySound()
         self.triggerHapticFeedback(style: .heavy)
        default: progress = 0.01
            answer = ""
            
        }
        showRandomImage()
//        if answerCorrect {
//            self.triggerHapticFeedback(style:.medium)
//        }
    }
    
    func showRandomImage() {
        currentImage = img.randomElement() ?? "USA"
    }
    
    func restart() {
        answer = ""
        progress = 0.01
        currentImage = img.randomElement() ?? "USA"
        
        
    }
    
    func PlaySound() {
        guard let url = Bundle.main.url(forResource: "Check", withExtension: "mp3") else { return }
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: url)
            audioPlayer?.play()
        } catch {
            
        }
        
    }
    
    func triggerHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
            let generator = UIImpactFeedbackGenerator(style: style)
            generator.impactOccurred()
        }
}

#Preview {
    ContentView()
}
