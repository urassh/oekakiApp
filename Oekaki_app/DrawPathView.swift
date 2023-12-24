//
//  DrawPathView.swift
//  Oekaki_app
//
//  Created by 浦山秀斗 on 2023/12/24.
//

import SwiftUI

struct DrawPathView: View {
    var drawPointsArray: [DrawPoints]
    @Binding var lineWidth: CGFloat
        
    var body: some View {
        ZStack {
            ForEach(drawPointsArray) { data in
                Path { path in
                    path.addLines(data.points)
                }
                .stroke(data.color, lineWidth: lineWidth)
            }
        }
    }
}

#Preview {
    DrawPathView(drawPointsArray: [], lineWidth: .constant(10.0))
}
