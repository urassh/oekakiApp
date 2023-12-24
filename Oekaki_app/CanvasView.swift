//
//  CanvasView.swift
//  Oekaki_app
//
//  Created by 浦山秀斗 on 2023/12/24.
//

import SwiftUI

struct CanvasView: View {
    @State var tmpDrawPoints: DrawPoints = DrawPoints(color: .red, points: [])
    @State var endedDrawPoints: [DrawPoints] = []
    @State var startPoint: CGPoint = CGPoint.zero
    @State var isValidDraw: Bool = true
    @Binding var selectedColor: Color
    @Binding var lineWidth: CGFloat
    
    private func isDrawArea(point: CGPoint, geometry: GeometryProxy) -> Bool {
        let valid_XArea = 0.0 < point.x && point.x < geometry.size.width
        let valid_YArea = 0.0 < point.y && point.y < 400.0
        
        return valid_XArea && valid_YArea
    }
    
    var body: some View {
        GeometryReader { geometry in
            RoundedRectangle(cornerSize:  CGSize(width: 20, height: 20))
                .fill(Color(uiColor: .lightGray))
                .frame(height: 400)
                .overlay(
                    DrawPathView(drawPointsArray: endedDrawPoints, lineWidth: $lineWidth)
                        .overlay(
                            Path { path in
                                path.addLines(self.tmpDrawPoints.points)
                            }
                            .stroke(self.tmpDrawPoints.color, lineWidth: lineWidth)
                        )
                )
                .overlay(
                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 20)).strokeBorder(Color(uiColor: UIColor(red: 0, green: 200, blue: 255, alpha: 0.65)), lineWidth: 8)
                )
                .gesture(
                    DragGesture()
                        .onChanged({ value in
                            guard isDrawArea(point: value.location, geometry: geometry) else { return }
                            guard self.startPoint != value.startLocation else { return }
                            self.tmpDrawPoints.points.append(value.location)
                            self.tmpDrawPoints.color = self.selectedColor
                        })
                        .onEnded({ value in
                            self.startPoint = value.startLocation
                            self.endedDrawPoints.append(self.tmpDrawPoints)
                            self.tmpDrawPoints = DrawPoints(color: self.selectedColor, points: [])
                        })
                )
        }
    }
}

#Preview {
    CanvasView(selectedColor: .constant(.black), lineWidth: .constant(10))
}
