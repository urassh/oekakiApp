//
//  ContentView.swift
//  Oekaki_app
//
//  Created by 浦山秀斗 on 2023/12/24.
//

import SwiftUI


struct ContentView: View {
    @State var color: Color = .red
    @State var lineWidth: CGFloat = 10.0
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("お絵描き App")
                .bold()
                .font(.largeTitle)
                .foregroundStyle(.black)
            
            CanvasView(selectedColor: $color, lineWidth: $lineWidth)
            
            ToolView(color: $color, lineWidth: $lineWidth)
            
            
            HStack {
                Spacer()
                
                Button(action: {
                    
                }, label: {
                    ZStack {
                        RoundedRectangle(cornerSize: CGSize(width: 12, height: 12))
                            .frame(width: 120, height: 70)
                        
                        Image(systemName: "camera.fill")
                            .resizable()
                            .scaledToFill()
                            .frame(width: 30, height: 30)
                            .foregroundStyle(.white)
                    }
                    
                })
                
                Spacer()
            }
            
            
            Spacer()
        }
        .padding()
    }
    
    
}

#Preview {
    ContentView()
}
