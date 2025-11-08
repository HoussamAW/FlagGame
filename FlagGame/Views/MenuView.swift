//
//  MenuView.swift
//  FlagGame
//
//  Created by Houssam  on 25/12/2023.
//

import SwiftUI
import UIKit

struct MenuView: View {
    @Environment(\.colorScheme) var colorSchemes
    @State private var showGameView = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.green.opacity(0.2)
                    .ignoresSafeArea()
                
                    Text("Menu")
                        .font(.title)
                        .bold()
                        
                }
            
            VStack {
                    Button {
                        showGameView.toggle()
                        triggerHapticFeedback(style: .medium)
                    } label: {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 250,height: 150)
                                    .foregroundColor(colorSchemes == .light ? .white: .black)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                    .shadow(color: .blue,radius: 3)
                                    
                                
                                Image("europe")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 150,height: 150)
                                    .shadow(radius: 5)
                                }
                                    Text("Europe")
                                        .font(.title)
                                        .foregroundStyle(.blue)
                                        .bold()
                                       
                            
                        }
                    }
                
             
                
                HStack(spacing:50) {
                    Button {
                        showGameView.toggle()
                        triggerHapticFeedback(style: .medium)
                    } label: {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 150,height: 150)
                                    .foregroundColor(colorSchemes == .light ? .white: .black)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                    .shadow(color: .purple,radius: 3)
                                
                                
                                Image("asie")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 130,height: 130)
                                    .shadow(radius: 5)
                                
                            }
                            Text("Asie")
                                .font(.title)
                                .foregroundStyle(.purple)
                                .bold()
                        }
                    }.fullScreenCover(isPresented: $showGameView) {
                       GameView()
                    }
                    
                    Button {
                        showGameView.toggle()
                        triggerHapticFeedback(style: .medium)
                    } label: {
                        VStack {
                            ZStack {
                                Rectangle()
                                    .frame(width: 150,height: 150)
                                    .foregroundColor(colorSchemes == .light ? .white: .black)
                                    .cornerRadius(20)
                                    .shadow(radius: 3)
                                    .shadow(color: .green,radius: 3)
                                
                                
                                Image("afrique")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 130,height: 130)
                                    .shadow(radius: 5)
                            }
                            Text("Afrique")
                                .font(.title)
                                .foregroundStyle(.green)
                                .bold()
                        }
                    }
                }
                
                Button {
                    showGameView.toggle()
                    triggerHapticFeedback(style: .medium)
                } label: {
                    VStack {
                        ZStack {
                            Rectangle()
                                .frame(width: 250,height: 150)
                                .foregroundColor(colorSchemes == .light ? .white: .black)
                                .cornerRadius(20)
                                .shadow(radius: 3)
                                .shadow(color: .red,radius: 3)
                            
                            HStack {
                                Image("ameriquedunord")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100,height: 130)
                                    .shadow(radius: 5)
                                
                                Image("ameriquedusud")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 100,height: 130)
                                    .shadow(radius: 5)
                                }
                            }
                                Text("Amerique")
                                    .font(.title)
                                    .foregroundStyle(.red)
                                    .bold()
                        }
                }
                
                Spacer()
                
            }.padding(.bottom,40)
            //.navigationBarItems(trailing: HelpView())
        }
    }
}



func triggerHapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.impactOccurred()
    }

#Preview {
    MenuView()
}
