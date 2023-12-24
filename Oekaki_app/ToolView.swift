//
//  ToolView.swift
//  Oekaki_app
//
//  Created by 浦山秀斗 on 2023/12/24.
//

import SwiftUI

struct ToolView: View {
    @Binding var color: Color
    @Binding var lineWidth: CGFloat
    
    var body: some View {
        VStack(spacing: 12) {
//            HStack {
//                Button(action: {
//                    color = .clear
//                }, label: {
//                    Image(systemName: "eraser.fill")
//                        .resizable()
//                        .scaledToFit()
//                        .frame(width: 50, height: 50)
//                    
//                })
//                
//                Spacer()
//            }
            
            HStack() {
                colorButton(color: .red)
                colorButton(color: .green)
                colorButton(color: .blue)
                colorButton(color: .yellow)
                colorButton(color: .purple)
                colorButton(color: .brown)
            }
            
            HStack {
                Text("線幅")
                    .font(.headline)
                Slider(value: $lineWidth, in: 0.0...10.0)
                    .accentColor(color)
                    .padding()
            }
        }.padding()
    }
    
    @ViewBuilder
    private func colorButton(color: Color) -> some View {
        Button(action: {
            self.color = color
        }, label: {
            RoundedRectangle(cornerSize: CGSize(width: 10, height: 10))
                .frame(width: 50, height: 50)
                .foregroundStyle(color)
        })
    }
}
